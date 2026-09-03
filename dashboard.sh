#!/bin/bash

source modules/system.sh
source modules/cpu.sh
source modules/memory.sh
source modules/disk.sh
source modules/network.sh
source modules/services.sh
source modules/logs.sh
source modules/process.sh


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
	system_info
	read -p "Press enter to continue ...."
	;;

2)
	cpu_info
	read -p "Press enter to continue ...."
	;;

3)
	memory_info
	read -p "Press enter to continue ...."
	;;
4)
	disk_info
	read -p "Press enter to continue ...."
	;;
5)
	process_manager
	read -p "Press enter to continue ...."
	;;
6)
	service_manager
	read -p "Press enter to continue ...."
	;;
7)
	network_tools
	read -p "Press enter to continue ...."
	;;
8)
	logs_viewer
	read -p "Press enter to continue ...."
	;;
9)
	echo "9. Opening Backup Utility..."
	read -p "Press enter to continue ...."
	;;
10)
	echo "10. Opening User Management..."
	read -p "Press enter to continue ...."
	;;
11)
	echo "11. Opening Generate Report..."
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
