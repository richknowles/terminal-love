# 💻 Terminal Love

[![Build Status](https://img.shields.io/badge/build-passing-brightgreen.svg)](https://github.com/richknowles/terminal-love)
[![OS](https://img.shields.io/badge/platform-macOS%20%7C%20Linux-blue.svg)](#)
[![License](https://img.shields.io/badge/license-personal--use-red.svg)](#)
[![Made With ❤️ by Rich Knowles](https://img.shields.io/badge/made%20with-%E2%9D%A4%EF%B8%8F%20by%20Rich%20Knowles-black.svg)](#)

> A PG-13, romantic, geeky, network-aware terminal splash screen system designed for long-distance lovers, private servers, and jet-lagged hearts.
>> Reminds you who you love (and who loves you).

---
# 🌐 What It Shows

✅ Splash intro banner with ASCII love
🌎 Local and external IP info
🌤 Weather in London and your current city
🕰 Time in London and your local time
📶 Wi-Fi status (macOS only)
🛬 Countdown until touchdown (and days since connection)
💖 Designed for terminal sweethearts, sysadmins, and romantics with root

## 📦 Installation

### 🐧 Linux (Debian/Ubuntu)

1. **Clone the repo**  
   ```bash
      git clone https://github.com/richknowles/terminal-love.git
      cd terminal-love/terminal-love-linux
      chmod +x install.sh
      ./install.sh

### 🍎 Installation (macOS)
Double-click the signed .pkg file found in:
   ```bash
      terminal-love/terminal-love-mac/terminal-love.pkg

If macOS complains about system volume write, use the manual version:
    ```bash
       sudo cp terminal-love-mac/payload/usr/local/bin/*.sh /usr/local/bin/

### Shell Config
And add this line to your shell config (~/.zshrc, ~/.bashrc, etc.):
```bash
[ -x /usr/local/bin/terminal-love.sh ] && /usr/local/bin/terminal-love.sh

>Note: The installer auto-adds to your shell config:

~/.bashrc for Bash
~/.zshrc for Zsh
~/.config/fish/config.fish for F

### 🔥 Uninstall
```bash
sudo rm /usr/local/bin/terminal-love.sh
sudo rm /usr/local/bin/terminal-love-network.sh
# And remove the launch line from your shell config

### !Pro Tip!
>Use this as your own terminal landing page—add more ASCII, quotes, weather feeds, or private status widgets.

### 🧠 Rich Knowles
GitHub: @richknowles
