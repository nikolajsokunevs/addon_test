#!/bin/bash
set -e

CONFIG_PATH=/data/options.json

ON_TEMPERATURE=$(jq --raw-output '.onTemperature // empty' $CONFIG_PATH)
OFF_TEMPERATURE=$(jq --raw-output '.offTemperature // empty' $CONFIG_PATH)
LED_NUMBER=$(jq --raw-output '.ledNumber // empty' $CONFIG_PATH)
echo "${ON_TEMPERATURE}"
echo "${OFF_TEMPERATURE}"
echo "${LED_NUMBER}"


python -u ./controlFan.py ${ON_TEMPERATURE} ${OFF_TEMPERATURE} "${LED_NUMBER}"