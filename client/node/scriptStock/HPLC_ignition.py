#!/usr/bin/python3

import RPi.GPIO as GPIO
import time
import argparse

# GPIOピンの番号を設定
GPIO_PIN = 18

# コマンドライン引数の解析
parser = argparse.ArgumentParser(description='1秒間だけ電流を流すプログラム')
parser.add_argument('--on', help='HPLCを発火', action="store_true")
args = parser.parse_args()

# GPIOのモードをセットアップ
GPIO.setmode(GPIO.BCM)
GPIO.setup(GPIO_PIN, GPIO.OUT)

try:
    if args.on:
        # HPLCを発火
        GPIO.output(GPIO_PIN, GPIO.HIGH)
        time.sleep(1)
    
    # 電流を止める
    GPIO.output(GPIO_PIN, GPIO.LOW)

finally:
    # GPIOを解放
    GPIO.cleanup()




