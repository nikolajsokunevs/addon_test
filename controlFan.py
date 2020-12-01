import RPi.GPIO as GPIO
import sys
import time

onTemperature=sys.argv[1]
offTemperature=sys.argv[2]
pin=sys.argv[3]

def cpu_temp():
    with open("/sys/class/thermal/thermal_zone0/temp", 'r') as f:
        return float(f.read())/1000

def main():

    GPIO.setmode(GPIO.BCM)
    GPIO.setwarnings(False)
    GPIO.setup(int(pin),GPIO.OUT)
    is_close = True
    GPIO.output(int(pin),GPIO.LOW)
	
    while True:
        temp = cpu_temp()
        if is_close:
            if temp > float(onTemperature):
                print(temp, 'Fan ON')
                GPIO.output(int(pin),GPIO.HIGH)
                is_close = False
        else:
            if temp < float(offTemperature):
                print(temp, 'Fan OFF')
                GPIO.output(int(pin),GPIO.LOW)
                is_close = True

        time.sleep(2.0)
        print(temp)


if __name__ == '__main__':
    main()