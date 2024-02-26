#!/usr/bin/python3

import argparse

parser = argparse.ArgumentParser(description='コマンドライン引数で動作を分岐')

parser.add_argument('--get', help='return random integer from range (1,100)', action='store_true')


args = parser.parse_args()

res = None

if args.get:
    with open("Output.txt", encoding="ANSI") as f:
        datalist = []
        productlist = []
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
            if "product" in line:
                productlist.append(line[4])
        productlist = [int(s) for s in productlist]
        #print(productlist)

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
    print(my_bzaldehyde)
    print(my_bzacid)
    print(my_bzalcohol)
    res = [my_bzaldehyde,my_bzacid,my_bzalcohol]



# (res:OK 値　単位)
if res is not None:
    print(res)
else:
    print('ERROR')
