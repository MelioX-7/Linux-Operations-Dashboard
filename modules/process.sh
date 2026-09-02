#!/bin/bash

process_manager() {

	while true
	do

		clear

	echo "===================================="
        echo "          PROCESS MANAGER"
        echo "===================================="
        echo

        echo "1. All Processes"
        echo "2. Top CPU Processes"
        echo "3. Top Memory Processes"
        echo "4. Search Process"
        echo "5. Kill Process"
        echo "0. Back"
        echo

	read -p "Choose an Option :" process_choice
	echo

	case "$process_choice" in

		1)
			ps aux
                	read -p "Press Enter to continue..."
                	;;

                2)
                	ps aux --sort=-%cpu | head -n 11
                	read -p "Press Enter to continue..."
                	;;

                3)
                	ps aux --sort=-%mem | head -n 11
                	read -p "Press Enter to continue..."
                	;;

                4)
                	echo "Search Process"

			read -p "Enter the process name :" process_name
			pgrep -a "$process_name"

                	read -p "Press Enter to continue..."
                	;;

                5)
                	echo "Kill Process"

			read -p "Enter PID to kill: " pid

			if [[ "$pid" =~ ^[0-9]+$ ]]
    			then
				if [ "$pid" -eq 1 ]
				then 
					echo
					echo "The Process P1 cannot be terminated from the dashboard."
    				elif kill "$pid" 2>/dev/null
    				then
        				echo
        				echo "Process $pid terminated."
    				else
        				echo
        				echo "Failed to terminate process $pid."
    				fi
			else
				echo
				echo "Invalid PID. Please enter a number."
			fi

                	read -p "Press Enter to continue..."
                    	;;

                0)
                	return
                	;;

                *)
                	echo "Invalid option."
                	read -p "Press Enter to continue..."
                	;;

        esac

    done
}
