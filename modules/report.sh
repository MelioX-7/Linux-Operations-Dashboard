#!/bin/bash

generate_report() {

    timestamp=$(date +"%Y-%m-%d_%H-%M-%S")
    report_file="reports/system_report_${timestamp}.txt"

    echo "Generating system report..."

    echo "====================================" > "$report_file"
    echo "        LINUX SYSTEM REPORT" >> "$report_file"
    echo "====================================" >> "$report_file"
    echo >> "$report_file"

    echo "Generated: $(date)" >> "$report_file"
    echo "Hostname: $(hostname)" >> "$report_file"
    echo "Kernel: $(uname -r)" >> "$report_file"

    echo >> "$report_file"

    echo "CPU INFORMATION" >> "$report_file"
    echo "------------------------------------" >> "$report_file"
    echo "CPU Cores: $(nproc)" >> "$report_file"
    echo "CPU Usage: $(top -bn1 | grep "%Cpu" | awk '{for(i=1;i<=NF;i++) if($i ~ /id,/) {idle=$(i-1); print 100-idle}}')%" >> "$report_file"
    echo "Load Average: $(uptime | awk -F'load average: ' '{print $2}')" >> "$report_file"

    echo >> "$report_file"

    echo "MEMORY INFORMATION" >> "$report_file"
    echo "------------------------------------" >> "$report_file"
    echo "Total Memory: $(free -h | awk '/Mem:/ {print $2}')" >> "$report_file"
    echo "Used Memory: $(free -h | awk '/Mem:/ {print $3}')" >> "$report_file"
    echo "Free Memory: $(free -h | awk '/Mem:/ {print $4}')" >> "$report_file"
    echo "Available Memory: $(free -h | awk '/Mem:/ {print $7}')" >> "$report_file"

    echo >> "$report_file"

    echo "DISK INFORMATION" >> "$report_file"
    echo "------------------------------------" >> "$report_file"
    df -h >> "$report_file"

    echo >> "$report_file"



    echo "NETWORK INFORMATION" >> "$report_file"
    echo "------------------------------------" >> "$report_file"

    echo "Network Interfaces:" >> "$report_file"
    ip -br link >> "$report_file"

    echo >> "$report_file"

    echo "IP Addresses:" >> "$report_file"
    ip -br addr >> "$report_file"

    echo >> "$report_file"

    echo "Routing Table:" >> "$report_file"
    ip route >> "$report_file"

    echo >> "$report_file"



    echo "SERVICES INFORMATION" >> "$report_file"
    echo "------------------------------------" >> "$report_file"

    echo "Running Services:" >> "$report_file"
    systemctl list-units --type=service --state=running --no-pager >> "$report_file"

    echo >> "$report_file"

    echo "Failed Services:" >> "$report_file"
    systemctl --failed --no-pager >> "$report_file"

    echo >> "$report_file"


    echo "Report saved to: $report_file"



}
