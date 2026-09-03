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
        echo

        case $service_choice in

            1)
                echo "Running Services"
                echo

                systemctl list-units --type=service --state=running --no-pager

                read -p "Press Enter to Continue ...."
                ;;

            2)
                read -p "Enter the Service Name : " service

                echo
                systemctl status "$service" --no-pager

                read -p "Press Enter to Continue ...."
                ;;

            3)
                read -p "Enter the Service Name : " service

                echo

                if sudo systemctl start "$service"
                then
                    echo
                    echo "Service '$service' started successfully."
                else
                    echo
                    echo "Failed to start service '$service'."
                fi

                read -p "Press Enter to Continue ...."
                ;;

            4)
                read -p "Enter the Service Name : " service

                echo

                if sudo systemctl stop "$service"
                then
                    echo
                    echo "Service '$service' stopped successfully."
                else
                    echo
                    echo "Failed to stop service '$service'."
                fi

                read -p "Press Enter to Continue ...."
                ;;

            5)
                read -p "Enter the Service Name : " service

                echo

                if sudo systemctl restart "$service"
                then
                    echo
                    echo "Service '$service' restarted successfully."
                else
                    echo
                    echo "Failed to restart service '$service'."
                fi

                read -p "Press Enter to Continue ...."
                ;;

            6)
                read -p "Enter the Service Name : " service

                echo

                if sudo systemctl enable "$service"
                then
                    echo
                    echo "Service '$service' enabled successfully."
                else
                    echo
                    echo "Failed to enable service '$service'."
                fi

                read -p "Press Enter to Continue ...."
                ;;

            7)
                read -p "Enter the Service Name : " service

                echo

                if sudo systemctl disable "$service"
                then
                    echo
                    echo "Service '$service' disabled successfully."
                else
                    echo
                    echo "Failed to disable service '$service'."
                fi

                read -p "Press Enter to Continue ...."
                ;;

            0)
                break
                ;;

            *)
                echo "Invalid Option. Please Try Again."
                read -p "Press Enter to Continue ...."
                ;;

        esac

    done
}
