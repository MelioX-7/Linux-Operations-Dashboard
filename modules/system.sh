#!/bin/bash




system_info() {

source /etc/os-release

echo "===================================="
echo "         SYSTEM INFORMATION         "
echo "===================================="
echo

echo "Hostname         : $(hostname)"
echo "Current User     : $(whoami)"
echo "Operating System : $PRETTY_NAME"
echo "Kernel Version   : $(uname -r)"
echo "Architecture     : $(uname -m)"
echo "System Uptime    : $(uptime -p)"
echo "Current Date     : $(date +"%d-%m-%Y")"
echo "Current Time     : $(date +"%I:%M:%S %p")"
echo


echo "===================================="
echo

}
