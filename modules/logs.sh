#!/bin/bash

logs_viewer() {

    echo "===================================="
    echo "            LOG VIEWER"
    echo "===================================="
    echo

    echo "1. Recent Logs"
    echo "2. Error Logs"
    echo "3. Warning Logs"
    echo "4. Search Logs"
    echo "5. Follow Logs"
    echo "6. Dashboard Logs"
    echo "0. Back"
    echo

    read -p "Choose an option: " log_choice

    case "$log_choice" in

        1)
            journalctl -n 20
            ;;

        2)
            journalctl -p err -n 20
            ;;

        3)
            journalctl -p warning -n 20
            ;;

        4)
            echo "Search Logs"
	    read -p "Enter the search term : " search_term
	    journalctl | grep -i "$search_term"
            ;;

        5)
            journalctl -f
            ;;

	6)
	    tail -n 10 logs/dashboard.log
	    ;;
        0)
            return
            ;;

        *)
            echo "Invalid option."
            ;;

    esac
}
