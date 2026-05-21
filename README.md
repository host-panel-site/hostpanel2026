# 🖥️ HostPanel

> **Modern web hosting control panel built with Node.js — fully in Romanian & English**

[![Version](https://img.shields.io/badge/version-2.1.2-blue.svg)](https://github.com/host-panel-site/hostpanel2026/releases)
[![License](https://img.shields.io/badge/license-MIT-green.svg)](LICENSE)
[![Node.js](https://img.shields.io/badge/node.js-18%2B-brightgreen.svg)](https://nodejs.org/)
[![Platform](https://img.shields.io/badge/platform-Ubuntu%2022%2F24-orange.svg)](https://ubuntu.com/)

![HostPanel Dashboard](https://raw.githubusercontent.com/host-panel-site/hostpanel2026/main/screenshot.png)

---

## ✨ Features

| Module | Description |
|--------|-------------|
| 🌐 **Domains** | Add, manage and delete domains with Apache vhosts |
| 🔒 **SSL** | Automatic Let's Encrypt certificates + wildcard SSL |
| 🗄️ **Databases** | MySQL/MariaDB management with phpMyAdmin integration |
| 📧 **Email** | Postfix + Dovecot + DKIM + webmail (Roundcube) |
| 🔁 **DNS** | Full BIND9 zone management with A, CNAME, MX, TXT records |
| ☁️ **Backup** | Automatic cloud backup to Dropbox / Google Drive / OneDrive |
| 🛡️ **Firewall** | UFW rules management with one-click toggles |
| 👥 **Multi-user** | User accounts with subdomains and isolated environments |
| ⚖️ **Load Balancer** | Multi-server load balancing with automatic DNS round-robin |
| 🤖 **AI Website Builder** | Generate complete websites using AI (OpenAI / Anthropic / Gemini) |
| 🌍 **Auto Translator** | Automatic UI translation based on IP + browser language (10 languages) |
| 🔐 **2FA** | Two-factor authentication via Microsoft/Google Authenticator |
| 📊 **Real-time Stats** | Live CPU, RAM, disk and network monitoring |
| 🔄 **Auto Updates** | One-click panel updates with version management |

---

## 🚀 One-line Install

```bash
curl -sSL http://iptvrestream.online:88/install/install.sh > /tmp/install.sh && bash /tmp/install.sh
```

**Requirements:**
- Ubuntu 22.04 or 24.04 (fresh install recommended)
- Minimum 2 vCPU, 2GB RAM, 20GB disk
- Root access
- A domain pointed to your server IP

---

## 📋 What the installer does

The install script automatically sets up:

1. ✅ Node.js 18+ and all dependencies
2. ✅ Apache2 with mod_rewrite, mod_ssl, mod_proxy
3. ✅ MySQL/MariaDB + phpMyAdmin
4. ✅ BIND9 DNS server (ns1 + ns2 ready)
5. ✅ Postfix + Dovecot + Roundcube webmail
6. ✅ Let's Encrypt (Certbot) for SSL
7. ✅ UFW firewall with safe defaults
8. ✅ HostPanel service (auto-start on boot)
9. ✅ Admin account creation
10. ✅ Email notification on install complete

**Install time:** ~5–10 minutes depending on server speed.

---

## 🖥️ Demo & Docs

- 🌐 **Website:** [host-panel.online](https://host-panel.online)
- 📖 **Documentation:** [host-panel.online/pages/docs.html](https://host-panel.online/pages/docs.html)
- 🎬 **Live Demo:** [host-panel.online/pages/demo.html](https://host-panel.online/pages/demo.html)

---

## 📸 Screenshots

<details>
<summary>Click to expand screenshots</summary>

**Dashboard**
> Real-time server stats, domain overview, quick actions

**DNS Manager**
> Full zone editor with all record types

**SSL Manager**
> One-click Let's Encrypt + wildcard certificate management

**Multi-user Panel**
> Isolated user environments with custom subdomains

</details>

---

## 🗺️ Roadmap

- [ ] Docker support
- [ ] Nginx option alongside Apache
- [ ] S3-compatible backup storage
- [ ] Mobile app (React Native)
- [ ] Marketplace for one-click app installs (WordPress, Ghost, etc.)

---

## 🌍 Languages

The panel UI supports **10 languages** with automatic detection:

🇷🇴 Romanian · 🇬🇧 English · 🇩🇪 German · 🇫🇷 French · 🇪🇸 Spanish · 🇮🇹 Italian · 🇭🇺 Hungarian · 🇧🇬 Bulgarian · 🇺🇦 Ukrainian · 🇷🇺 Russian

---

## 📄 License

MIT License — free to use, modify and distribute.

---

## 🤝 Support

- 📧 Email: [contact@host-panel.site](mailto:contact@host-panel.site)
- 🐛 Issues: [GitHub Issues](https://github.com/host-panel-site/hostpanel2026/issues)
- 🌐 Website: [host-panel.online](https://host-panel.online)

---

<p align="center">Built with ❤️ using Node.js · Apache · BIND9 · Let's Encrypt</p>
