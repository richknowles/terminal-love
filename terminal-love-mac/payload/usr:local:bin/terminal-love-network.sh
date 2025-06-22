#!/usr/bin/env bash
# Terminal Love – Network diagnostics (macOS)

show_network_info() {
  local BG="$1" FG="$2" ACCENT="$3"

  echo -e "\033[48;5;${BG}m\033[38;5;${FG}m📡  Network Diagnostics\033[0m"
  echo -e "• Hostname: $(hostname)"
  echo -e "• Local IP: $(ipconfig getifaddr en0 2>/dev/null || echo 'N/A')"
  echo -e "• External IP: $(curl -s https://ifconfig.me || echo 'N/A')"
  echo -e "• Tailscale IP: $(tailscale ip -4 2>/dev/null || echo 'Down')"
  echo -e "• Wi‑Fi SSID: $(networksetup -getairportnetwork en0 | awk -F': ' '{print $2}' || echo 'N/A')"
  echo -e "• Signal Strength: $(/System/Library/PrivateFrameworks/Apple80211.framework/Versions/Current/Resources/airport -I 2>/dev/null | awk -F': ' '/agrCtlRSSI/ {print $2}') dBm"
  echo -e "• Open Ports:"
  lsof -iTCP -sTCP:LISTEN -nP | awk '{print $1, $8, $9}' | column -t | tail -n +2 | head -n 10
  echo
}
