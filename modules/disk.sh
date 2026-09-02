#!/bin/bash



disk_info() {
	
	disk=$(df -h / | awk 'NR==2')
	
	filesystem=$(echo "$disk" | awk '{print $1}')
	total=$(echo "$disk" | awk '{print $2}')
	used=$(echo "$disk" | awk '{print $3}')
	available=$(echo "$disk" | awk '{print $4}')
	usage=$(echo "$disk" | awk '{print $5}')
	mount=$(echo "$disk" | awk '{print $6}')




    echo "===================================="
    echo "          DISK MONITORING"
    echo "===================================="
    echo

    echo "Filesystem        : $filesystem"
    echo "Total Space       : $total"
    echo "Used Space        : $used"
    echo "Available Space   : $available"
    echo "Usage             : $usage"
    echo "Mounted On        : $mount"

    echo
    echo "===================================="
}


