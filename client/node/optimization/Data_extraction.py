import sys
import json
import os

message = sys.stdin.readline()

#print(message)
def calculate_yield(file_path, number):
    with open(file_path, encoding="ANSI", errors="ignore") as f:
        datalist = []
        productlist = [0,0,0,0]
        #HPLCデータ抽出
        for line in f:
            if line.startswith("Peak#"):
                while not line.isspace():
                    line = f. readline()
                    data = line.split()
                    #空白行を追加しないための処理
                    if line.isspace():
                        break
                    datalist.append(data)
                """
                print(datalist) 
                print(datalist[0]) 
                print(datalist[0][0]) 
                """
        #HPLC面積取得
        for line in datalist:
            if "benzylalcohol" in line:
                productlist.insert(0,line[4])
            elif "benzoicacid" in line:
                productlist.insert(1,line[4])
            elif "benzaldehyde" in line:
                productlist.insert(2,line[4])
            elif "nitrobenzene" in line:
                productlist.insert(3,line[4])

        productlist = [int(s) for s in productlist]
        #print(productlist)

    if productlist[3] == 0:
        print("Error!! internal standard material value = 0")

    #収率算出処理
    ism = productlist[3]
    benzaldehyde = productlist[2]
    benzoicacid = productlist[1]
    benzylalcohol = productlist[0]
    mw_bzaldehyde = 106.12
    mw_bzacid = 122.12
    mw_bzalcohol = 108.14
    #検量線factor
    f_bzaldehyde = 0.6109
    f_bzacid = 8.9087
    f_bzalcohol = 37.9153
    #内標重量
    sample_weight = 0.0523
    ism_rate = 0.03745
    ism_weight = sample_weight * ism_rate * 0.01
    #原料、仕込んだ基質
    material_weight = 11.12 #g
    substrate = 0.0015 #mol
    #収率計算
    y_bzaldehyde = ((benzaldehyde/ism)*f_bzaldehyde*ism_weight)/sample_weight*material_weight/mw_bzaldehyde/substrate*100
    y_bzacid = ((benzoicacid/ism)*f_bzacid*ism_weight)/sample_weight*material_weight/mw_bzacid/substrate*100
    y_bzalcohol = ((benzylalcohol/ism)*f_bzalcohol*ism_weight)/sample_weight*material_weight/mw_bzalcohol/substrate*100
    #修正百分率
    sum = y_bzaldehyde + y_bzacid + y_bzalcohol
    my_bzaldehyde = y_bzaldehyde*100/sum
    my_bzacid = y_bzacid*100/sum
    my_bzalcohol = y_bzalcohol*100/sum
    """
    print(my_bzaldehyde)
    print(my_bzacid)
    print(my_bzalcohol)
    """
    response = {"number":number, "benzaldehyde": my_bzaldehyde, "benzoicacid": my_bzacid, "benzylalcohol": my_bzalcohol}
    return response

folder_path = "Output"
file_paths = [os.path.join(folder_path, file) for file in os.listdir(folder_path) if os.path.isfile(os.path.join(folder_path, file))]

results = []

for i, file_path in enumerate(file_paths, start=1):
    results.append(calculate_yield(file_path, i))

print(json.dumps(results))
