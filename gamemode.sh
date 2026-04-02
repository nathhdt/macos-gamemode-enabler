#!/bin/bash

set -euo pipefail

G='\033[0;32m' Y='\033[0;33m' B='\033[0;34m' C='\033[0;36m'
BOLD='\033[1m' NC='\033[0m'

info()  { echo -e "${B}[INFO]${NC}  $1"; }
ok()    { echo -e "${G}[OK]${NC}    $1"; }
warn()  { echo -e "${Y}[WARN]${NC}  $1"; }

echo -e "\n${BOLD}${C}══════════════════════════════════════════════════════${NC}"
echo -e "${BOLD}${C}  macos-gamemode-enabler${NC}"
echo -e "${BOLD}${C}══════════════════════════════════════════════════════${NC}\n"

if [ ! -d "/System/Applications/Chess.app" ] && [ ! -d "/Applications/Chess.app" ]; then
    echo -e "${Y}Chess.app not found - cannot trigger Game Mode${NC}"
    exit 1
fi

info "launching Chess in fullscreen..."

osascript <<'APPLESCRIPT'
tell application "Chess"
    activate
    delay 1.5
end tell

tell application "System Events"
    tell process "Chess"
        keystroke "f" using {control down, command down}
    end tell
end tell
APPLESCRIPT

sleep 3

CHESS_PID=$(pgrep -x "Chess" 2>/dev/null || true)
if [ -n "$CHESS_PID" ]; then
    renice +20 -p "$CHESS_PID" > /dev/null 2>&1 || true
fi

echo ""
ok "Game Mode enabled"
echo ""
echo -e "  ${G}✓${NC} Bluetooth sampling rate doubled"
echo -e "  ${G}✓${NC} Chess deprioritized (nice +20)"
echo ""
echo -e "  ${BOLD}${Y}⚠  keep Chess in fullscreen in the background${NC}"
echo -e "  ${BOLD}${Y}   closing it disables Game Mode${NC}"
echo ""