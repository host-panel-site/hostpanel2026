#!/bin/bash
# ============================================================
#  HostPanel — One-line Installer
#  Usage: curl -sSL https://raw.githubusercontent.com/host-panel-site/hostpanel2026/main/install.sh -o install.sh && bash install.sh
#  Supported: Ubuntu 22.04 / 24.04
#  Requires: root access
# ============================================================

set -e

# ── Colors ───────────────────────────────────────────────────
RED='\033[0;31m'; GREEN='\033[0;32m'; YELLOW='\033[1;33m'
CYAN='\033[0;36m'; BOLD='\033[1m'; NC='\033[0m'

log()  { echo -e "${CYAN}[HostPanel]${NC} $1"; }
ok()   { echo -e "${GREEN}✓${NC} $1"; }
warn() { echo -e "${YELLOW}⚠${NC} $1"; }
err()  { echo -e "${RED}✗ ERROR:${NC} $1"; exit 1; }

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

# ── Checks ───────────────────────────────────────────────────
[ "$EUID" -ne 0 ] && err "Please run as root: sudo bash install.sh"

OS=$(lsb_release -si 2>/dev/null || echo "Unknown")
VER=$(lsb_release -sr 2>/dev/null || echo "0")
[[ "$OS" != "Ubuntu" ]] && err "Ubuntu 22.04 or 24.04 required. Detected: $OS"
[[ "$VER" != "22.04" && "$VER" != "24.04" ]] && warn "Tested on 22.04/24.04. Your version: $VER"

log "System check passed: $OS $VER"

# ── Collect info ─────────────────────────────────────────────
echo ""
echo -e "${BOLD}━━━ Setup Information ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
echo -e "  ${DIM}Press Enter to skip optional fields${NC}"
echo ""

# Email — singurul câmp obligatoriu
read -p "  Admin email: " ADMIN_EMAIL
[ -z "$ADMIN_EMAIL" ] && err "Admin email is required"

# Restul — opționale, Enter = skip
read -p "  Panel domain (optional, Enter to skip): " PANEL_DOMAIN
read -s -p "  Admin password (optional, Enter to skip): " ADMIN_PASS; echo ""
read -p "  Nameserver 1 (optional, Enter to skip): " NS1
read -p "  Nameserver 2 (optional, Enter to skip): " NS2

echo ""
log "Starting installation..."
echo ""

# ── Download & run actual installer ──────────────────────────
INSTALL_URL="https://host-panel.online/install/install.sh"

log "Downloading full installer..."
curl -sSL "$INSTALL_URL" -o /tmp/hostpanel-install.sh || err "Failed to download installer. Check your internet connection."
chmod +x /tmp/hostpanel-install.sh

# Pasează variabilele — installerul principal le va folosi dacă sunt setate
export HP_EMAIL="$ADMIN_EMAIL"
[ -n "$PANEL_DOMAIN" ] && export HP_DOMAIN="$PANEL_DOMAIN"
[ -n "$ADMIN_PASS" ]   && export HP_PASS="$ADMIN_PASS"
[ -n "$NS1" ]          && export HP_NS1="$NS1"
[ -n "$NS2" ]          && export HP_NS2="$NS2"

bash /tmp/hostpanel-install.sh

# ── Done ─────────────────────────────────────────────────────
echo ""
echo -e "${GREEN}${BOLD}━━━ Installation Complete! ━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
echo ""
if [ -n "$PANEL_DOMAIN" ]; then
  echo -e "  🌐 Panel URL:   ${CYAN}https://${PANEL_DOMAIN}:8443${NC}"
fi
echo -e "  📧 Admin:       ${CYAN}${ADMIN_EMAIL}${NC}"
echo -e "  📖 Docs:        ${CYAN}https://host-panel.online/pages/docs.html${NC}"
echo ""
echo -e "${BOLD}  Thank you for installing HostPanel!${NC}"
echo ""
