#!/bin/bash

# === Fan Speed Mapping (RPM to PWM) ===
# Approximate values based on ASUS TUF A15 calibration
declare -A rpm_to_pwm=(
    [2000]=160
    [2500]=175
    [3000]=185
    [3500]=195
    [3700]=200
    [4000]=210
    [4200]=219
    [4400]=227
    [4500]=235
    [4700]=242
    [5000]=250
)

# === List of supported RPMs ===
supported_rpms=(2000 2500 3000 3500 3700 4000 4200 4400 4500 4700 5000)

# === Functions ===

show_menu() {
    echo "Supported Fan Speeds (RPM):"
    for rpm in "${supported_rpms[@]}"; do
        echo -n "$rpm "
    done
    echo
}

get_pwm_for_rpm() {
    local rpm=$1
    echo "${rpm_to_pwm[$rpm]}"
}

# === User Input ===

echo "=== Set CPU Fan Speed ==="
show_menu
read -p "Enter desired CPU fan speed (RPM): " cpu_rpm

echo -e "\n=== Set GPU Fan Speed ==="
show_menu
read -p "Enter desired GPU fan speed (RPM): " gpu_rpm

# Validate input
if [[ ! " ${supported_rpms[*]} " =~ " ${cpu_rpm} " ]]; then
    echo "Invalid CPU RPM selected."
    exit 1
fi

if [[ ! " ${supported_rpms[*]} " =~ " ${gpu_rpm} " ]]; then
    echo "Invalid GPU RPM selected."
    exit 1
fi

# Get PWM values
cpu_pwm=$(get_pwm_for_rpm "$cpu_rpm")
gpu_pwm=$(get_pwm_for_rpm "$gpu_rpm")

# Apply fan curves
echo -e "\nSetting CPU fan to $cpu_rpm RPM (PWM: $cpu_pwm)"
sudo asusctl fan-curve --mod-profile performance --fan cpu --data "30c:$cpu_pwm,40c:$cpu_pwm,50c:$cpu_pwm,60c:$cpu_pwm,70c:$cpu_pwm,80c:$cpu_pwm,90c:$cpu_pwm,100c:$cpu_pwm"

echo -e "\nSetting GPU fan to $gpu_rpm RPM (PWM: $gpu_pwm)"
sudo asusctl fan-curve --mod-profile performance --fan gpu --data "30c:$gpu_pwm,40c:$gpu_pwm,50c:$gpu_pwm,60c:$gpu_pwm,70c:$gpu_pwm,80c:$gpu_pwm,90c:$gpu_pwm,100c:$gpu_pwm"

# Enable custom fan curves
echo -e "\nEnabling custom fan curves..."
sudo asusctl fan-curve --mod-profile performance --enable-fan-curves true

# Apply performance profile
echo -e "\nSwitching to performance profile..."
sudo asusctl profile performance

# Show current fan speeds
echo -e "\n✅ Current Fan Speeds:"
asusctl fan-speed
