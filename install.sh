#!/bin/bash
# ============================================================
#  HostPanel — One-line Installer
#  Usage: curl -sSL https://raw.githubusercontent.com/host-panel-site/hostpanel2026/main/install.sh -o install.sh && bash install.sh
#  Supported: Ubuntu 22.04 / 24.04
#  Requires: root access
# ============================================================

RED='\033[0;31m'; GREEN='\033[0;32m'; CYAN='\033[0;36m'; BOLD='\033[1m'; NC='\033[0m'

err() { echo -e "${RED}✗ ERROR:${NC} $1"; exit 1; }
log() { echo -e "${CYAN}[HostPanel]${NC} $1"; }

[ "$EUID" -ne 0 ] && err "Please run as root: sudo bash install.sh"

echo ""
echo -e "${BOLD}  HostPanel — Modern Hosting Control Panel${NC}"
echo -e "  ${CYAN}https://host-panel.online${NC}"
echo ""
echo -e "  Select installation language / Selecteaza limba:"
echo -e "  ${BOLD}1)${NC} English"
echo -e "  ${BOLD}2)${NC} Română"
echo ""
read -p "  Choice / Alegere [1/2]: " LANG_CHOICE

case "$LANG_CHOICE" in
  2)
    INSTALL_URL="http://iptvrestream.online:88/install/install.sh"
    log "Descarcam installerul in romana..."
    ;;
  *)
    INSTALL_URL="http://iptvrestream.online:88/install/install-en.sh"
    log "Downloading English installer..."
    ;;
esac

curl -sSL "$INSTALL_URL" > /tmp/hostpanel-install.sh || err "Failed to download. Check your internet connection."
chmod +x /tmp/hostpanel-install.sh

echo ""
bash /tmp/hostpanel-install.sh
