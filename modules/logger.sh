#!/bin/bash

LOG_FILE="logs/dashboard.log"

log_message() {
    local level="$1"
    local message="$2"

    echo "$(date '+%Y-%m-%d %H:%M:%S') | $level | $message" >> "$LOG_FILE"
}
