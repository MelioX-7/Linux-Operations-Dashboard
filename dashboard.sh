#!/bin/bash

source modules/system.sh
source modules/cpu.sh
source modules/memory.sh
source modules/disk.sh
source modules/network.sh
source modules/services.sh
source modules/logs.sh
source modules/process.sh
source modules/backup.sh
source modules/users.sh
source modules/report.sh
source modules/logger.sh


log_message "INFO" "Dashboard started"


while true
do
clear	




echo "========================================="
echo "     Linux Operations Dashboard"
echo "========================================="
echo
echo "1. System Information"
echo 
echo "2. CPU Monitoring" 
echo
echo "3. Memory Monitoring" 
echo
echo "4. Disk Monitoring" 
echo
echo "5. Process Manager" 
echo
echo "6. Service Manager"
echo 
echo "7. Network Tools"
echo 
echo "8. Log Viewer"
echo 
echo "9. Backup Utility"
echo 
echo "10. User Management"
echo 
echo "11. Generate Report"
echo
echo "0. Exit"
echo


read -p "Choose an Option : " choice
echo
echo "You Selected : $choice"
echo

case $choice in

1)
	log_message "INFO" "System Information selected"
	system_info
	read -p "Press enter to continue ...."
	;;

2)
	log_message "INFO" "CPU Monitoring selected"
	cpu_info
	read -p "Press enter to continue ...."
	;;

3)
	log_message "INFO" "Memory Monitoring selected"
	memory_info
	read -p "Press enter to continue ...."
	;;
4)
	log_message "INFO" "Disk Monitoring selected"
	disk_info
	read -p "Press enter to continue ...."
	;;
5)
	log_message "INFO" "Process Manager selected"
	process_manager
	read -p "Press enter to continue ...."
	;;
6)
	log_message "INFO" "Service Manager selected"
	service_manager
	read -p "Press enter to continue ...."
	;;
7)
	log_message "INFO" "Network Tools selected"
	network_tools
	read -p "Press enter to continue ...."
	;;
8)
	log_message "INFO" "Log Viewer selected"
	logs_viewer
	read -p "Press enter to continue ...."
	;;
9)
	log_message "INFO" "Backup Utility selected"
	backup_utility
	read -p "Press enter to continue ...."
	;;
10)
	log_message "INFO" "User Management selected"
	user_management
	read -p "Press enter to continue ...."
	;;
11)
	log_message "INFO" "Report Generation selected"
	generate_report
	report_management
	read -p "Press enter to continue ...."
	;;
0)
		echo "Thank You for using Linux Operations Dashboard!"
		echo
		break
	;;

*)
	echo "Invalid Option Please Try Again"
	echo
	;;

esac

done
