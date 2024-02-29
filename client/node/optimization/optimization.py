import sys
import json
import scipy
import itertools
import numpy as np
from scipy.optimize import minimize

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
        return (x_max - x_min)*x + x_min
    elif len(x.shape) == 2:
        descaled_x = np.zeros_like(x)
        for k in range(x.shape[1]):
            descaled_x[:, k] = (x_max - x_min)*x[:, k] + x_min
        return descaled_x


def gaussian_cumulative_distribution(x):  # cdf
    return 0.5*(1 + scipy.special.erf(x/(np.sqrt(2))))  # For vector calculation


def gaussian_probability_density(x):  # PDF
    return np.exp(-0.5*x**2)/np.sqrt(2*np.pi)


def matern_52_function_kernel(x1, x2, kernel_parameter):
    r = np.linalg.norm(x1 - x2)
    kb = np.sqrt(5)*r/kernel_parameter
    ka = 1 + kb + kb**2 / 3
    return ka*np.exp(-kb)


def cal_kernel_value_of_sample(sample_x, kernel, kernel_parameter, kernel_delta):
    data_num = sample_x.shape[1]
    kernel_value_of_sample = np.zeros((data_num, data_num))
    for k in range(data_num):
        for kk in range(data_num):
            kernel_value_of_sample[k, kk] = kernel(sample_x[:, k], sample_x[:, kk], kernel_parameter)
    kernel_value_of_sample = kernel_value_of_sample + kernel_delta*np.eye(data_num)
    return kernel_value_of_sample


def predicted_mean(x, sample_x, sample_y, kernel_value_of_sample, kernel, kernel_parameter, kernel_delta,
                   epsilon=1e-10):
    data_num = sample_x.shape[1]
    kernel_x_and_samples = np.zeros(data_num)
    for k in range(data_num):
        kernel_x_and_samples[k] = kernel(x, sample_x[:, k], kernel_parameter)
    kernel_x_and_x = kernel(x, x, kernel_parameter) + kernel_delta
    inverse_of_kernel_values = np.linalg.inv(kernel_value_of_sample + epsilon*np.eye(data_num))
    mean_value = kernel_x_and_samples.T @ inverse_of_kernel_values @ sample_y.T
    variance_value = kernel_x_and_x - kernel_x_and_samples.T @ inverse_of_kernel_values @ kernel_x_and_samples + epsilon
    std_value = np.sqrt(variance_value)
    return mean_value, std_value


def cal_kernel_delta(x_dim, sample_x, sample_y, kernel_value_of_sample, kernel, kernel_parameter, total_std):
    def cal_total_std(kernel_delta, center_x, sample_x, sample_y, kernel_value_of_sample, kernel, kernel_parameter,
                      total_std):
        _, std_value = predicted_mean(center_x, sample_x, sample_y,
                                      kernel_value_of_sample + kernel_delta*np.eye(kernel_value_of_sample.shape[0]),
                                      kernel, kernel_parameter, kernel_delta)
        #print((std_value - total_std)**2)
        return (std_value - total_std)**2
    center_x = np.zeros(x_dim)
    for i in range(x_dim):
        center_x[i] = 0.5
    kernel_delta = np.zeros(1)
    domain = np.zeros((1, 2))
    domain[0, 0], domain[0, 1] = 1e-5, 1e5
    opt_fcn = lambda x: cal_total_std(x, center_x=center_x, sample_x=sample_x, sample_y=sample_y,
                                      kernel_value_of_sample=kernel_value_of_sample, kernel=kernel,
                                      kernel_parameter=kernel_parameter, total_std=total_std)
    result = minimize(opt_fcn, kernel_delta, bounds=domain, method='SLSQP')
    kernel_delta = result.x
    return kernel_delta


def cal_expected_improvement(x, sample_x, sample_y, kernel_value_of_sample, kernel, kernel_parameter,
                             kernel_delta, epsilon=1e-10):
    data_num = sample_x.shape[1]
    kernel_x_and_samples = np.zeros(data_num)
    for k in range(data_num):
        kernel_x_and_samples[k] = kernel(x, sample_x[:, k], kernel_parameter)
    kernel_x_and_x = kernel(x, x, kernel_parameter) + kernel_delta
    inverse_of_kernel_values = np.linalg.inv(kernel_value_of_sample + epsilon*np.eye(data_num))
    mean_value = kernel_x_and_samples.T @ inverse_of_kernel_values @ sample_y.T
    variance_value = kernel_x_and_x - kernel_x_and_samples.T @ inverse_of_kernel_values @ kernel_x_and_samples + epsilon
    std_value = np.sqrt(variance_value)
    min_sample_y = np.min(sample_y)
    absolute_EI = -mean_value + min_sample_y
    scaled_EI = absolute_EI / std_value  # Maybe some good name for this value?
    EI = absolute_EI*gaussian_cumulative_distribution(scaled_EI) + std_value*gaussian_probability_density(scaled_EI)
    return -EI  # to use minimize_method


def expected_improvement(mesh_num, sample_x, sample_y, kernel_value_of_sample, kernel, kernel_parameter, kernel_delta,
                         domain, selection_num, opt_point=5):
    x_dim = sample_x.shape[0]
    mesh = np.linspace(0, 1, mesh_num)  # 0-1 scale
    x_opt = np.zeros((x_dim, selection_num))
    EI_opt = np.zeros(selection_num)

    for i in range(selection_num):
        x_list = np.array(list(itertools.product(mesh, repeat=x_dim))).T
        EI_list = np.zeros(mesh_num ** x_dim)
        y_list = np.zeros(mesh_num ** x_dim)
        for k in range(mesh_num**x_dim):
            EI_list[k] = cal_expected_improvement(x_list[:, k], sample_x, sample_y, kernel_value_of_sample, kernel,
                                                  kernel_parameter, kernel_delta)
            y_list[k], _ = predicted_mean(x_list[:, k], sample_x, sample_y, kernel_value_of_sample, kernel,
                                          kernel_parameter, kernel_delta)
            if np.isnan(EI_list[k]):
                EI_list[k] = 0

        EI_ini_index_list = np.argpartition(-EI_list, -opt_point)[-opt_point:]
        x_ini_list = x_list[:, EI_ini_index_list]
        EI_ini_list = EI_list[EI_ini_index_list]
        x_opt_list = np.zeros((x_dim, opt_point))
        EI_opt_list = np.zeros(opt_point)
        for k in range(opt_point):
            opt_fcn = lambda x: cal_expected_improvement(x, sample_x=sample_x, sample_y=sample_y,
                                                         kernel_value_of_sample=kernel_value_of_sample,
                                                         kernel=kernel, kernel_parameter=kernel_parameter,
                                                         kernel_delta=kernel_delta)
            result = minimize(opt_fcn, x_ini_list[:, k], bounds=scale(domain, domain[:, 0], domain[:, 1]),
                              method='SLSQP')
            x_opt_list[:, k] = result.x
            EI_opt_list[k] = result.fun
            if np.isnan(EI_opt_list[k]):
                x_opt_list[:,k] = x_ini_list[:,k]
                EI_opt_list[k] = EI_ini_list[k]
            #print("?",result)

        EI_opt[i] = np.min(EI_opt_list)
        x_opt[:, i] = x_opt_list[:, np.argmin(EI_opt_list)]

        if np.isnan(EI_opt[i]):
            #print('There is NaN in EI calculation')
            EI_opt[i] = np.min(EI_list)
            x_opt[:, i] = x_list[:, np.argmin(EI_opt)]
            #print(EI_opt, x_opt)

        # update sample_x, sample_y, kernel_value_of_sample
        best_x = x_opt[:, i].reshape(-1, 1)
        mean_value, std_value = predicted_mean(best_x[:, 0], sample_x, sample_y, kernel_value_of_sample, kernel,
                                               kernel_parameter, kernel_delta)
        #print("mean_value", mean_value, "std_value", std_value)
        #print("best_x", best_x)
        sample_x = np.hstack((sample_x, best_x))
        sample_y = np.append(sample_y, mean_value + std_value)
        kernel_value_of_sample = kernel_update(sample_x, best_x, kernel, kernel_parameter, kernel_delta,
                                               kernel_value_of_sample)

    expected_y = sample_y[-selection_num:]
    return x_opt, -EI_opt, expected_y  # to return EI, not to return -EI


def kernel_update(sample_x, best_x, kernel, kernel_parameter, kernel_delta, kernel_value_of_sample):
    kernel_h = np.zeros((sample_x.shape[1] - 1, 1))
    kernel_v = np.zeros((1, sample_x.shape[1]))
    for i in range(sample_x.shape[1] - 1):
        kernel_h[i, 0] = kernel(sample_x[:, i], best_x[:, 0], kernel_parameter)
        kernel_v[0, i] = kernel_h[i, 0]
    kernel_v[0, sample_x.shape[1] - 1] = kernel(best_x[:, 0], best_x[:, 0], kernel_parameter) + kernel_delta
    kernel_value_of_sample = np.hstack((kernel_value_of_sample, kernel_h))
    kernel_value_of_sample = np.vstack((kernel_value_of_sample, kernel_v))
    return kernel_value_of_sample


# stdinからデータを読み込む
data = json.loads(sys.stdin.read())
#print(data)
variables = data["variables"]
results = data["results"]

key_to_find = "benzaldehyde"  # これは探したいキーです
values = []

for result_list in data["results"]:
    for result in result_list:
        if result["key"] == key_to_find:
            values.append(result["value"])

#print(json.dumps(values))  # これは指定したキーのすべての値のリストです

# 各nameごとにデータをまとめる
grouped_data = {}
for entry in variables:
    number = entry["number"]
    name = entry["name"]
    value = entry["value"]

    if name not in grouped_data:
        grouped_data[name] = {"values": [], "numbers": []}

    grouped_data[name]["values"].append(value)
    grouped_data[name]["numbers"].append(number)

# 結果を構築
sample_x = [grouped_data[name]["values"] for name in sorted(grouped_data.keys(), key=lambda x: grouped_data[x]["numbers"])]

sample_x = np.array(sample_x)
sample_y = np.array([values])
sample_y = -1*sample_y
"main code"

mesh_num = 10  # you should not change

kernel = matern_52_function_kernel  # your preference
kernel_parameter = 0.5 #三次元で1.4、小さいほど不確実性を優先、精度がよくなる
kernel_delta = 0.01

# experiment condition and first data
selection_num = 1 #次の条件の数?
x_dim = 2
data_num = len(sample_y)
#domain = np.zeros((x_dim, 2))
domain = np.array([[20, 40],[1,4]]) 
min_y = -100
max_y = 0
#sample_x = np.zeros((x_dim, data_num))
#sample_y = np.zeros(data_num)

# BO loop
loop_num = 1
for i in range(loop_num):
    # scaling
    scaled_sample_x = scale(sample_x, domain[:, 0], domain[:, 1])
    scaled_sample_y = scale(sample_y, min_y, max_y)

    # decide next condition
    kernel_value_of_sample = cal_kernel_value_of_sample(scaled_sample_x, kernel, kernel_parameter, kernel_delta)
    #連続でないなら以下を変更
    best_x, EI, expected_y = expected_improvement(mesh_num, scaled_sample_x, scaled_sample_y, kernel_value_of_sample,
                                                  kernel, kernel_parameter, kernel_delta, domain, selection_num)

    # experiment

    # Input update
    best_x = np.array(best_x).reshape(x_dim, -1)
    best_descaled_x = descale(best_x, domain[:, 0], domain[:, 1])
    sample_x = np.hstack((sample_x, best_descaled_x))
    
    # Output update
    best_y = np.zeros(selection_num)  # experiment result
    sample_y = np.append(sample_y, best_y)

# データを表示する
grouped_data_keys = list(grouped_data.keys())
result_dict = {key: value.tolist() for key, value in zip(grouped_data_keys, best_descaled_x)}

#print(result_dict)

response = {"variables": variables, "results": values}
json_data = json.dumps(result_dict)

print(json_data)
