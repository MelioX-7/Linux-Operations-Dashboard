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

    echo "Kernel: $(uname -r)" >> "$report_file"

    echo >> "$report_file"

    echo "CPU INFORMATION" >> "$report_file"
    echo "------------------------------------" >> "$report_file"
    echo "CPU Cores: $(nproc)" >> "$report_file"
    echo "CPU Usage: $(top -bn1 | grep "%Cpu" | awk '{for(i=1;i<=NF;i++) if($i ~ /id,/) {idle=$(i-1); print 100-idle}}')%" >> "$report_file"
    echo "Load Average: $(uptime | awk -F'load average: ' '{print $2}')" >> "$report_file"

    echo >> "$report_file"




    echo "Report saved to: $report_file"


}
