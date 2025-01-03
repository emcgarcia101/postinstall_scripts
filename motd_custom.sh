#!/bin/bash

# Colors
GREEN="\033[1;32m"
CYAN="\033[1;36m"
YELLOW="\033[1;33m"
RESET="\033[0m"

# System Info
OS=$(lsb_release -d | cut -f2)
IP=$(hostname -I | awk '{print $1}')
PUB_IP=$(curl -s ifconfig.me || echo "N/A")
UPTIME=$(uptime -p)
LOAD=$(cat /proc/loadavg | awk '{print $1, $2, $3}')
MEM_TOTAL=$(free -m | awk '/^Mem:/{print $2}')
MEM_USED=$(free -m | awk '/^Mem:/{print $3}')
MEM_FREE=$((MEM_TOTAL - MEM_USED))
MEM_PERCENT=$((100 * MEM_USED / MEM_TOTAL))
DISK_INFO=$(df -h / | awk 'NR==2 {print $3 " used, " $4 " free"}')
DISK_USED=$(df / | awk 'NR==2 {print $3}')
DISK_TOTAL=$(df / | awk 'NR==2 {print $2}')
DISK_PERCENT=$(df / | awk 'NR==2 {print $5}')

# Create percentage bar
create_bar() {
    local percent=$1
    local size=20
    local filled=$((percent * size / 100))
    local empty=$((size - filled))
    printf "[${GREEN}$(printf '#%.0s' $(seq 1 $filled))${RESET}$(printf ' %.0s' $(seq 1 $empty))] ${percent}%%"
}


# Output
echo -e "${CYAN}Logged as:${RESET} $(whoami)"
echo -e "${CYAN}OS:${RESET} $OS"
echo -e "${CYAN}IP Address:${RESET} $IP"
echo -e "${CYAN}Public IP Address:${RESET} $PUB_IP"
echo -e "${CYAN}Uptime:${RESET} $UPTIME"
echo -e "${CYAN}Load Average:${RESET} $LOAD"

echo -e "${CYAN}Memory:${RESET} $(create_bar $MEM_PERCENT) (${MEM_USED}M used, ${MEM_FREE}M free)"
echo -e "${CYAN}Disk Space:${RESET} $(create_bar ${DISK_PERCENT%\%}) (${DISK_INFO})"
