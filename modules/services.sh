#!/bin/bash


service_manager() {

	while true
	do

		clear

		echo "===================================="
        	echo "          SERVICE MANAGER"
        	echo "===================================="
        	echo

        	echo "1. List Running Services"
        	echo "2. Service Status"
        	echo "3. Start Service"
        	echo "4. Stop Service"
        	echo "5. Restart Service"
        	echo "6. Enable Service"
        	echo "7. Disable Service"
        	echo "0. Back"
        	echo

		read -p "Choose an Option : " service_choice

		case "$service_choice" in

			1)
				systemctl list-units --type=service --state=running --no-pager
				read -p "Press Enter to Continue ..."
				;;

			2)
				read -p "Enter the Service Name :" service_name
				echo
				systemctl status "$service_name" --no-pager
				read -p "Press Enter to Continue ..."
				;;

			3)
    				read -p "Enter the Service Name :" service_name

    				if [[ "$service_name" != *.service ]]
    				then
        				service_name="${service_name}.service"
    				fi

    					sudo systemctl start "$service_name"

    				if systemctl is-active --quiet "$service_name"
    				then
        				echo
        				echo "Service '$service_name' started successfully."
    				else
        				echo
        				echo "Failed to start service '$service_name'."
    				fi

    				read -p "Press Enter to Continue ..."
    				;;

			4)
				 read -p "Enter the Service Name :" service_name

    				 if [[ "$service_name" != *.service ]]
    				 then
        				service_name="${service_name}.service"
    				 fi

    				 if systemctl is-active --quiet "$service_name"
    				 then
        				sudo systemctl stop "$service_name"

        				if systemctl is-active --quiet "$service_name"
        			 	then
            					echo
            					echo "Failed to stop service '$service_name'."
        			 else
            					echo
            					echo "Service '$service_name' stopped successfully."
        			 fi
    				 else
        					echo
        					echo "Service '$service_name' is not currently running."
    				 fi

    				 read -p "Press Enter to Continue ..."
    				 ;;

			5)
    				 read -p "Enter the Service Name :" service_name

    				 if [[ "$service_name" != *.service ]]
    				 then
        				service_name="${service_name}.service"
    				 fi

    				 if systemctl is-active --quiet "$service_name"
    				 then
        				sudo systemctl restart "$service_name"

        				if systemctl is-active --quiet "$service_name"
        				then
            					echo
            					echo "Service '$service_name' restarted successfully."
        				else
            					echo
            					echo "Failed to restart service '$service_name'."
        				fi
    				 else
        					echo
       	 					echo "Service '$service_name' is not currently running."
    				 fi

    				 read -p "Press Enter to Continue ..."
    				 ;;

			6)
				read -p "Enter the Service Name :" service_name

    				if [[ "$service_name" != *.service ]]
    				then
        				service_name="${service_name}.service"
    				fi

    					sudo systemctl enable "$service_name"

    				if systemctl is-enabled --quiet "$service_name"
    				then
        				echo
        				echo "Service '$service_name' enabled successfully."
    				else
        				echo
        				echo "Failed to enable service '$service_name'."
    				fi

    				read -p "Press Enter to Continue ..."
    				;;


			7)
    				read -p "Enter the Service Name :" service_name

    				if [[ "$service_name" != *.service ]]
    				then
        				service_name="${service_name}.service"
    				fi

    				sudo systemctl disable "$service_name"

    				if systemctl is-enabled --quiet "$service_name"
    				then
        				echo
        				echo "Failed to disable service '$service_name'."
    				else
        				echo
        				echo "Service '$service_name' disabled successfully."
    				fi

    				read -p "Press Enter to Continue ..."
    				;;


			0)
				return
				;;

			*)
				echo "Invalid Option"
				read -p "Press Enter to Continue..."
				;;
			esac
		done
}
