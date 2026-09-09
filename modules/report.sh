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

    echo "Report saved to: $report_file"
}
