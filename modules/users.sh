#!/bin/bash

user_management() {

    while true
    do
        clear

        echo "===================================="
        echo "          USER MANAGEMENT"
        echo "===================================="
        echo
        echo "1. List Users"
        echo "2. User Information"
        echo "3. Add User"
        echo "4. Delete User"
        echo "5. Change Password"
        echo "6. Lock User"
        echo "7. Unlock User"
        echo "8. Logged-in Users"
        echo "0. Back"
        echo
        echo "===================================="

        read -p "Enter your choice: " user_choice

        case $user_choice in

            1)
                echo
                echo "Users:"
                cut -d: -f1 /etc/passwd
                ;;

            2)
                echo
                read -p "Enter username: " username

                if id "$username" &>/dev/null
                then
                    echo
                    echo "User Information"
                    echo "-------------------------"
                    id "$username"
                    echo
                    echo "Home Directory:"
                    getent passwd "$username" | cut -d: -f6
                    echo
                    echo "Login Shell:"
                    getent passwd "$username" | cut -d: -f7
                else
                    echo "User does not exist."
                fi
                ;;

            3)
                echo
                read -p "Enter username to add: " username

                if id "$username" &>/dev/null
                then
                    echo "User already exists."
                else
                    if sudo useradd -m "$username"
                    then
                        echo "User created successfully."
                        echo
                        sudo passwd "$username"
                    else
                        echo "Failed to create user."
                    fi
                fi
                ;;

            4)
                echo
                read -p "Enter username to delete: " username

                if id "$username" &>/dev/null
                then
                    read -p "Are you sure you want to delete '$username'? (y/n): " confirm

                    if [ "$confirm" = "y" ]
                    then
                        if sudo userdel "$username"
                        then
                            echo "User deleted successfully."
                        else
                            echo "Failed to delete user."
                        fi
                    else
                        echo "Deletion cancelled."
                    fi
                else
                    echo "User does not exist."
                fi
                ;;

            5)
                echo
                read -p "Enter username: " username

                if id "$username" &>/dev/null
                then
                    sudo passwd "$username"
                else
                    echo "User does not exist."
                fi
                ;;

            6)
                echo
                read -p "Enter username to lock: " username

                if id "$username" &>/dev/null
                then
                    if sudo usermod -L "$username"
                    then
                        echo "User locked successfully."
                    else
                        echo "Failed to lock user."
                    fi
                else
                    echo "User does not exist."
                fi
                ;;

            7)
                echo
                read -p "Enter username to unlock: " username

                if id "$username" &>/dev/null
                then
                    if sudo usermod -U "$username"
                    then
                        echo "User unlocked successfully."
                    else
                        echo "Failed to unlock user."
                    fi
                else
                    echo "User does not exist."
                fi
                ;;

            8)
                echo
                echo "Currently Logged-in Users:"
                echo "-------------------------"
                who
                ;;

            0)
                break
                ;;

            *)
                echo
                echo "Invalid choice."
                ;;
        esac

        echo
        read -p "Press Enter to continue..."
    done
}
