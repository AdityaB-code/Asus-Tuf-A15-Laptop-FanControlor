#!/bin/bash

while true; do
    # Get CPU temperature
    cpu_temp=$(sensors | grep -E 'Tctl|Package id 0' | awk '{print $2}' | head -n1)

    # Get GPU temperature if nvidia-smi is available
    if command -v nvidia-smi &>/dev/null; then
        gpu_temp=$(nvidia-smi --query-gpu=temperature.gpu --format=csv,noheader)
    else
        gpu_temp="N/A"
    fi

    # Extract fan speeds using awk
    mapfile -t fan_values < <(sensors | awk '/asus-isa-000a/,/pwm1:/ { if ($1 == "cpu_fan:") cpu=$2; if ($1 == "gpu_fan:") gpu=$2 } END { print cpu; print gpu }')

    cpu_fan=${fan_values[0]}
    gpu_fan=${fan_values[1]}

    # Timestamp
    timestamp=$(date +"%a %b %d %I:%M:%S %p %Z %Y")

    # Print result
    echo "$timestamp: CPU Temp = ${cpu_temp:-N/A} | GPU Temp = ${gpu_temp:-N/A} | CPU Fan = ${cpu_fan:-N/A} | GPU Fan = ${gpu_fan:-N/A}"

    # Wait before next reading
    sleep 3
done
