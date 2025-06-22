#!/usr/bin/env bash
# Terminal Love v1.0 – Rich Knowles (macOS)

# Full reset (screen + scrollback)
clear && printf '\e[3J'  # clears scrollback buffer entirely :contentReference[oaicite:1]{index=1}

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
source "$SCRIPT_DIR/terminal-love-network.sh"

ALISA_START="2025-04-05"
ALISA_ARRIVAL="2025-08-18"
STATE_FILE="$HOME/.terminal_love_state"

SESSION_NUM=$(cat "$STATE_FILE" 2>/dev/null || echo 0)
((SESSION_NUM++))
echo "$SESSION_NUM" > "$STATE_FILE"

TODAY=$(date +%s)
START_SEC=$(date -j -f "%Y-%m-%d" "$ALISA_START" +%s)
ARR_SEC=$(date -j -f "%Y-%m-%d" "$ALISA_ARRIVAL" +%s)
DAYS_SINCE=$(((TODAY - START_SEC) / 86400))
DAYS_UNTIL=$(((ARR_SEC - TODAY) / 86400))

TIME_LONDON=$(TZ="Europe/London" date "+%H:%M")
TIME_LOCAL=$(date "+%H:%M")

if (( SESSION_NUM % 2 == 0 )); then
  BG=233; FG=250; ACCENT1=81; ACCENT2=208
else
  BG=24; FG=255; ACCENT1=117; ACCENT2=110
fi

show_network_info "$BG" "$FG" "$ACCENT1"

echo -e "\033[1m\033[38;5;${ACCENT1}mRich Knowles Proudly Presents!\033[0m"
echo -e "\033[48;5;${BG}m\033[38;5;${FG}m────────────────────────────────────────────────────────────────────────────\033[0m"
echo -e "\033[38;5;${ACCENT1}m🛩️  \033[38;5;${FG}m$DAYS_UNTIL Days Until Touchdown\033[38;5;${ACCENT2}m  ❤️  $DAYS_SINCE Days Since You Met"
echo -e "\033[38;5;${ACCENT1}m🕰️  London: $TIME_LONDON         \033[38;5;${ACCENT2}m🕰️ Local: $TIME_LOCAL"
echo -e "\033[48;5;${BG}m────────────────────────────────────────────────────────────────────────────\033[0m"

tput cnorm
exit 0
