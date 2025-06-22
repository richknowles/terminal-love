#!/usr/bin/env bash
# Terminal Love v1.0 – Rich Knowles

# === Full Terminal Reset ===
clear
printf "\e[2J\e[H"

# === Script Directory & Network Loader ===
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]:-$0}" )" && pwd )"
source "$SCRIPT_DIR/terminal-love-network.sh"

# === Configuration ===
ALISA_START="2025-04-05"
ALISA_ARRIVAL="2025-08-18"
STATE_FILE="$HOME/.terminal_love_state"

# === Session Counter ===
SESSION_NUM=$(cat "$STATE_FILE" 2>/dev/null || echo 0)
((SESSION_NUM++))
echo "$SESSION_NUM" > "$STATE_FILE"

# === Date Calculations ===
TODAY=$(date +%s)
START_TS=$(date -j -f "%Y-%m-%d" "$ALISA_START" +%s)
ARRIVAL_TS=$(date -j -f "%Y-%m-%d" "$ALISA_ARRIVAL" +%s)
DAYS_SINCE=$(( (TODAY - START_TS) / 86400 ))
DAYS_UNTIL=$(( (ARRIVAL_TS - TODAY) / 86400 ))

# === Timezones ===
TIME_LONDON=$(TZ="Europe/London" date "+%H:%M")
TIME_LOCAL=$(date "+%H:%M")

# === Theme Rotation ===
if (( SESSION_NUM % 2 == 0 )); then
  BG=233; FG=250; ACCENT1=81; ACCENT2=208
else
  BG=24; FG=255; ACCENT1=117; ACCENT2=110
fi

# === Display Network Info (Only once!) ===
show_network_info "$BG" "$FG" "$ACCENT1"

# === Signature ===
echo -e "\033[1m\033[38;5;${ACCENT1}mRich Knowles Proudly Presents!\033[0m"

# === Footer Status Bar ===
echo -e "\033[48;5;${BG}m\033[38;5;${FG}m────────────────────────────────────────────────────────────────────────────"
echo -e "\033[38;5;${ACCENT1}m🛩️  \033[38;5;${FG}m$DAYS_UNTIL Days Until Touchdown\033[38;5;${ACCENT2}m  ❤️  $DAYS_SINCE Days Since You Met"
echo -e "\033[38;5;${ACCENT1}m🕰️  London: $TIME_LONDON         \033[38;5;${ACCENT2}m🕰️ Local: $TIME_LOCAL"
echo -e "\033[38;5;${FG}m🌦️  London: Mostly Sunny       🌦️ Chicago: Light Rain"
echo -e "────────────────────────────────────────────────────────────────────────────\033[0m"

# === Finalize ===
tput cnorm
exit 0
