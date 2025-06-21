#!/bin/bash
# =====================================================
# Rich Knowles Proudly Presents... Terminal Love™ v1.0
# =====================================================

# === Config ===
ALISA_START="2025-04-05"
ALISA_ARRIVAL="2025-08-18"
JET_SOUND="$HOME/sounds/jet-touchdown.wav"
STATE_FILE="$HOME/.terminal_love_state"
SESSION_NUM=$(cat "$STATE_FILE" 2>/dev/null || echo 0)
((SESSION_NUM++))
echo "$SESSION_NUM" > "$STATE_FILE"

# === Date math ===
TODAY=$(date +%s)
START_TS=$(date -j -f "%Y-%m-%d" "$ALISA_START" +%s)
ARRIVAL_TS=$(date -j -f "%Y-%m-%d" "$ALISA_ARRIVAL" +%s)
DAYS_SINCE=$(( (TODAY - START_TS) / 86400 ))
DAYS_UNTIL=$(( (ARRIVAL_TS - TODAY) / 86400 ))

# === Timezones ===
TIME_LONDON=$(TZ="Europe/London" date "+%H:%M")
TIME_LOCAL=$(date "+%H:%M")

# === Theme rotation ===
if (( SESSION_NUM % 2 == 0 )); then
  # Midnight Horizon
  BG=233; FG=250; ACCENT1=81; ACCENT2=208
else
  # Rainstorm Glass
  BG=24; FG=255; ACCENT1=117; ACCENT2=110
fi

# === Display ===
tput civis
tput cup $(($(tput lines)-6)) 0
echo -e "\033[48;5;${BG}m\033[38;5;${FG}m────────────────────────────────────────────────────────────────────────────"
echo -e "\033[38;5;${ACCENT1}m🛩️  \033[38;5;${FG}m$DAYS_UNTIL Days Until Touchdown\033[38;5;${ACCENT2}m  ❤️  $DAYS_SINCE Days Since You Met"
echo -e "\033[38;5;${ACCENT1}m🕰️  London: $TIME_LONDON         \033[38;5;${ACCENT2}m🕰️ Local: $TIME_LOCAL"
echo -e "\033[38;5;${FG}m🌦️  London: Mostly Sunny       🌦️ Chicago: Light Rain"
echo -e "────────────────────────────────────────────────────────────────────────────"
echo -e "\033[1m\033[38;5;${ACCENT1}mRich Knowles Proudly Presents!\033[0m\033[48;5;${BG}m\033[0m"
tput cnorm

# === Sound ===
[[ -f "$JET_SOUND" ]] && afplay "$JET_SOUND" &>/dev/null &
