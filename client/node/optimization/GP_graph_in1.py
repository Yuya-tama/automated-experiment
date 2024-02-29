import numpy as np
import time
import openpyxl
from datetime import datetime
from matplotlib import pyplot as plt
from matplotlib import animation
import itertools
import sys
sys.path.append("for_tamai")
import for_tamai as dc


def scale(x, x_min, x_max):  # Scale up to matrix
    if len(x.shape) == 1:
        return (x - x_min) / (x_max - x_min)
    elif x.shape[0] == 1:
        return (x - x_min) / (x_max - x_min)
    elif len(x.shape) == 2:
        scaled_x = np.zeros_like(x)
        for k in range(x.shape[1]):
            scaled_x[:, k] = (x[:, k] - x_min) / (x_max - x_min)
        return scaled_x


def descale(x, x_min, x_max):  # De-scale up to matrix
    if len(x.shape) == 1:
        return (x_max - x_min)*x + x_min
    elif x.shape[0] == 1:
        return (x_max - x_min) * x + x_min
    elif len(x.shape) == 2:
        descaled_x = np.zeros_like(x)
        for k in range(x.shape[1]):
            descaled_x[:, k] = (x_max - x_min)*x[:, k] + x_min
        return descaled_x


def f(x): # objective function
    return 5.25*x ** 2 - 10 


def fig_GPR(plot_x, mu, sigma, x, y):
    x = x.reshape(-1)
    fig = plt.figure(figsize=(8, 6))
    plt.plot(plot_x, f(plot_x), 'k')
    plt.plot(x, y, 'r.', markersize=16)
    plt.plot(plot_x, mu, 'b')
    # データが正規分布に従う場合、95%信頼区間は平均から標準偏差の1.96倍以内の区間となる
    plt.fill_between(plot_x.squeeze(), mu.squeeze() - 1.9600 * sigma, mu.squeeze() + 1.9600 * sigma)
    plt.xlabel('$x$', fontsize=16)
    plt.ylabel('$y$', fontsize=16)
    plt.legend(['Objective function', 'Observed values', 'Predicted mean', '95% confidence interval'],
               loc='upper left', fontsize=16)
    plt.tick_params(labelsize=16)
    plt.show()


def fig_expected_improvement(plot_x, EI):
    fig = plt.figure(figsize=(8, 6))
    plt.plot(plot_x, EI)
    plt.xlabel('$x$', fontsize=16)
    plt.ylabel('Expected Improvement', fontsize=16)
    plt.tick_params(labelsize=16)
    plt.show()


def fig_std_value(sample_x, plot_x, std_value):
    sample_std_value = np.zeros((sample_x.shape[0], sample_x.shape[1]))
    for i in range(sample_x.shape[1]):
        for j in range(plot_x.shape[0]):
            if sample_x[0, i] == plot_x[j]:
                sample_std_value[0, i] = std_value[j]
    fig = plt.figure(figsize=(8, 6))
    plt.plot(sample_x, sample_std_value, 'r.', markersize=16)
    plt.plot(plot_x, std_value)
    plt.xlabel('$x$', fontsize=16)
    plt.ylabel('std_value', fontsize=16)
    plt.tick_params(labelsize=16)
    plt.show()


mesh_num = 10
sample_num = 3
kernel = dc.matern_52_function_kernel
kernel_parameter, kernel_delta, experience_delta = 0.1, 0.01, 0


# sample_x = np.linspace(-1, 2, sample_num)
# sample_x = np.atleast_2d(sample_x)
# sample_y = np.zeros(sample_num)
# for i in range(sample_num):
#     sample_y[i] = dc.former_objective_function(sample_x[:, i])

sample_x = np.array([[-1, 0, 1]])
sample_y = np.array([-4.75, -10, -4.75])
domain = np.array([[-1, 3]])
min_y = -10
max_y = 50

plot_x = np.linspace(-1, 3, mesh_num)
plot_x_graph = plot_x
plot_x = plot_x.reshape(-1)

scaled_sample_x = scale(sample_x, domain[:, 0], domain[:, 1])
scaled_sample_y = scale(sample_y, min_y, max_y)
plot_x = scale(plot_x, domain[0, 0], domain[0, 1])


kernel_value_of_sample = dc.cal_kernel_value_of_sample(scaled_sample_x, kernel, kernel_parameter, kernel_delta)
print(np.linalg.det(kernel_value_of_sample))
mean_value, std_value, expected_improvement = np.zeros(mesh_num), np.zeros(mesh_num), np.zeros(mesh_num)
max_ei = 0
for i in range(mesh_num):
    mean_value[i], std_value[i] = dc.predicted_mean(plot_x[i], scaled_sample_x, scaled_sample_y, kernel_value_of_sample, kernel,
                                                    kernel_parameter, kernel_delta, experience_delta)
    min_sample_y = np.min(scaled_sample_y)
    absolute_EI = -mean_value[i] + min_sample_y
    scaled_EI = absolute_EI / std_value[i]
    EI = absolute_EI * dc.gaussian_cumulative_distribution(scaled_EI) + std_value[i] * \
         dc.gaussian_probability_density(scaled_EI)
    print(EI)
    expected_improvement[i] = EI
    if expected_improvement[i] >= max_ei:
        max_ei = expected_improvement[i]
        best_x = plot_x[i]
        print("!!!", expected_improvement[i], plot_x[i], mean_value[i], std_value[i])

mean_value = descale(mean_value, min_y, max_y)
fig_GPR(plot_x_graph, mean_value, std_value, sample_x, sample_y)
fig_expected_improvement(plot_x_graph, expected_improvement)
#fig_std_value(sample_x, plot_x_graph, std_value)
