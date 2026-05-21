#!/bin/bash
# ============================================================
#  HostPanel — One-line Installer
#  Usage: curl -sSL https://raw.githubusercontent.com/host-panel-site/hostpanel2026/main/install.sh | bash
#  Supported: Ubuntu 22.04 / 24.04
#  Requires: root access, domain pointed to this server
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
# Suportă și argumente poziționale:
# bash install.sh panel.domain.com email@example.com password ns1.domain.com ns2.domain.com
PANEL_DOMAIN="${1:-}"
ADMIN_EMAIL="${2:-}"
ADMIN_PASS="${3:-}"
NS1="${4:-}"
NS2="${5:-}"

echo ""
echo -e "${BOLD}━━━ Setup Information ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
echo ""

# Citire interactivă cu /dev/tty — funcționează și cu curl | bash
if [ -z "$PANEL_DOMAIN" ]; then
  read -p "  Panel domain (e.g. panel.yourdomain.com): " PANEL_DOMAIN </dev/tty
fi

if [ -z "$ADMIN_EMAIL" ]; then
  read -p "  Admin email: " ADMIN_EMAIL </dev/tty
fi

if [ -z "$ADMIN_PASS" ]; then
  read -s -p "  Admin password: " ADMIN_PASS </dev/tty
  echo ""
fi

if [ -z "$NS1" ]; then
  read -p "  Nameserver 1 (e.g. ns1.yourdomain.com): " NS1 </dev/tty
fi

if [ -z "$NS2" ]; then
  read -p "  Nameserver 2 (e.g. ns2.yourdomain.com): " NS2 </dev/tty
fi

# ── Validare ─────────────────────────────────────────────────
[ -z "$PANEL_DOMAIN" ] && err "Panel domain is required"
[ -z "$ADMIN_EMAIL" ]  && err "Admin email is required"
[ -z "$ADMIN_PASS" ]   && err "Admin password is required"

echo ""
log "Starting installation for: ${BOLD}$PANEL_DOMAIN${NC}"
echo ""

# ── Download & run actual installer ──────────────────────────
INSTALL_URL="https://host-panel.online/install/install.sh"

log "Downloading full installer..."
curl -sSL "$INSTALL_URL" -o /tmp/hostpanel-install.sh || err "Failed to download installer. Check your internet connection."
chmod +x /tmp/hostpanel-install.sh

# Pasează variabilele către installerul complet
export HP_DOMAIN="$PANEL_DOMAIN"
export HP_EMAIL="$ADMIN_EMAIL"
export HP_PASS="$ADMIN_PASS"
export HP_NS1="$NS1"
export HP_NS2="$NS2"

# Rulează cu /dev/tty pentru input interactiv dacă mai cere ceva
bash /tmp/hostpanel-install.sh </dev/tty

# ── Done ─────────────────────────────────────────────────────
echo ""
echo -e "${GREEN}${BOLD}━━━ Installation Complete! ━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
echo ""
echo -e "  🌐 Panel URL:   ${CYAN}https://${PANEL_DOMAIN}:8443${NC}"
echo -e "  📧 Admin:       ${CYAN}${ADMIN_EMAIL}${NC}"
echo -e "  📖 Docs:        ${CYAN}https://host-panel.online/pages/docs.html${NC}"
echo ""
echo -e "${BOLD}  Thank you for installing HostPanel!${NC}"
echo ""
