#!/usr/bin/env bash
# terminal-love-network.sh – Terminal Love™ by Rich Knowles

show_network_info() {
  local BG=${1:-0} FG=${2:-7} ACCENT=${3:-6}

  echo -e "\033[48;5;${BG}m\033[38;5;${FG}m📡  Network Diagnostics\033[0m"
  echo -e "\033[38;5;${ACCENT}m• Hostname: \033[0m$(hostname)"
  echo -e "\033[38;5;${ACCENT}m• Local IP: \033[0m$(ipconfig getifaddr en0 2>/dev/null || echo 'N/A')"
  echo -e "\033[38;5;${ACCENT}m• External IP: \033[0m$(curl -s ifconfig.me || echo 'Unavailable')"
  echo -e "\033[38;5;${ACCENT}m• Tailscale IP: \033[0m$(tailscale ip -4 2>/dev/null || echo 'Down')"

  local ssid
  ssid=$(ipconfig getsummary \
    "$(networksetup -listallhardwareports | awk '/Wi[- ]Fi|AirPort/{getline; print $NF}')" \
    | awk -F ' SSID : ' '/ SSID : / {print $2}')
  echo -e "\033[38;5;${ACCENT}m• Wi‑Fi SSID: \033[0m${ssid:-N/A}"

  local rssi
  rssi=$(/System/Library/PrivateFrameworks/Apple80211.framework/Versions/Current/Resources/airport -I 2>/dev/null \
         | awk -F': ' '/agrCtlRSSI/ {print $2}')
  echo -e "\033[38;5;${ACCENT}m• Signal Strength: \033[0m${rssi:-N/A} dBm"

  echo -e "\033[38;5;${ACCENT}m• Open Ports:\033[0m"
  lsof -iTCP -sTCP:LISTEN -nP | awk '{print $1, $8, $9}' | column -t | tail -n +2 | head -10
  echo
}

show_network_info
