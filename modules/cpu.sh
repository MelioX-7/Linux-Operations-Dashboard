#!/bin/bash

cpu_info() {


cpu_model=$(lscpu | grep "Model name" | cut -d':' -f2 | xargs)

architecture=$(lscpu | grep "Architecture" | cut -d':' -f2 | xargs)

cpu_cores=$(lscpu | grep "^CPU(s):" | cut -d':' -f2 | xargs)

cpu_usage=$(top -bn1 | grep "%Cpu" | awk '{for(i=1;i<=NF;i++) if($i ~ /id,/) {idle=$(i-1); print 100-idle}}')

load_average=$(uptime | awk -F'load average: ' '{print $2}')



echo "===================================="
echo "         CPU MONITORING             "
echo "===================================="
echo

echo "CPU Model           : $cpu_model"
echo "CPU Architecture    : $architecture"
echo "CPU Cores           : $cpu_cores"
echo "CPU Usage           : $cpu_usage%"
echo "Load Average        : $load_average"
echo


echo "===================================="
echo

}
