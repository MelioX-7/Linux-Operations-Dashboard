#!/bin/bash

memory_info() {

    echo "===================================="
    echo "      MEMORY MONITORING"
    echo "===================================="
    echo

    echo "Total Memory      : $(free -h | awk '/Mem:/ {print $2}')"
    echo "Used Memory       : $(free -h | awk '/Mem:/ {print $3}')"
    echo "Free Memory       : $(free -h | awk '/Mem:/ {print $4}')"
    echo "Available Memory  : $(free -h | awk '/Mem:/ {print $7}')"
    echo
    echo "Swap Total        : $(free -h | awk '/Swap:/ {print $2}')"
    echo "Swap Used         : $(free -h | awk '/Swap:/ {print $3}')"
    echo "Swap Free         : $(free -h | awk '/Swap:/ {print $4}')"

}
