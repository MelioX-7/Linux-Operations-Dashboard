#!/bin/bash

network_interfaces() {

    echo "===================================="
    echo "        NETWORK INTERFACES"
    echo "===================================="
    echo

    ip -br link

    echo
    echo "===================================="
}


network_ip() {

    echo "===================================="
    echo "           IP ADDRESSES"
    echo "===================================="
    echo

    ip -br addr

    echo
    echo "===================================="
}

routing() {

    echo "===================================="
    echo "          ROUTING TABLE"
    echo "===================================="
    echo

    ip route

    echo
    echo "===================================="

}


dns_info() {

    echo "===================================="
    echo "          DNS INFORMATION"
    echo "===================================="
    echo

    resolvectl status

    echo
    echo "===================================="
}

connectivity_test() {

    echo "===================================="
    echo "        CONNECTIVITY TEST"
    echo "===================================="
    echo

    read -p "Enter Hostname or IP Address: " host

    echo
    echo "Testing connectivity to $host..."
    echo

    if ping -c 4 "$host" > /dev/null 2>&1
    then
        echo "Connectivity Test: SUCCESS"
        echo "$host is reachable."
    else
        echo "Connectivity Test: FAILED"
        echo "$host is unreachable."
    fi

    echo
    echo "===================================="
}


network_tools() {

    while true
    do

        clear

        echo "===================================="
        echo "          NETWORK TOOLS"
        echo "===================================="
        echo

        echo "1. Network Interfaces"
        echo "2. IP Addresses"
        echo "3. Routing Table"
        echo "4. DNS Information"
        echo "5. Test Connectivity"
        echo "0. Back"
        echo

        read -p "Choose an Option : " network_choice
        echo

        case $network_choice in

            1)
                network_interfaces
                read -p "Press Enter to Continue ...."
                ;;

            2)
                network_ip
                read -p "Press Enter to Continue ...."
                ;;

            3)
                routing
                read -p "Press Enter to Continue ...."
                ;;

            4)
                dns_info
                read -p "Press Enter to Continue ...."
                ;;

            5)
                connectivity_test
                read -p "Press Enter to Continue ...."
		;;

	    0)
		break
		;;

            *)
                echo "Invalid Option"
                read -p "Press Enter to Continue ...."
                ;;

        esac

    done
}
