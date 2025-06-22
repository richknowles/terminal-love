#!/usr/bin/env bash
# Terminal Love – Network diagnostics (Linux)

show_network_info() {
  local BG="$1" FG="$2" ACCENT="$3"
  echo -e "\033[48;5;${BG}m\033[38;5;${FG}m📡  Network Diagnostics\033[0m"
  echo -e "• Hostname: $(hostname)"
  echo -e "• Local IP: $(hostname -I | awk '{print $1}' || echo 'N/A')"
  echo -e "• External IP: $(curl -s https://ifconfig.me || echo 'N/A')"
  echo -e "• Tailscale IP: $(tailscale ip -4 2>/dev/null || echo 'Down')"
  echo -e "• Open Ports:"
  ss -tulwn | awk '$1=="LISTEN"' | head -n 10
  echo
}
