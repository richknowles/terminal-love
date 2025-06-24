#!/usr/bin/env bash
# Terminal Love Linux Installer – by Rich Knowles

set -e

echo "📦 Installing Terminal Love..."

BIN_DIR="/usr/local/bin"
REPO_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# Remove old files from /usr/bin if any
echo "🧹 Cleaning up old files in /usr/bin..."
sudo rm -f /usr/bin/terminal-love.sh /usr/bin/terminal-love-network.sh 2>/dev/null || true

# Copy new files
echo "📥 Copying files to $BIN_DIR..."
sudo install -m 755 "$REPO_DIR/terminal-love.sh" "$BIN_DIR/terminal-love.sh"
sudo install -m 755 "$REPO_DIR/terminal-love-network.sh" "$BIN_DIR/terminal-love-network.sh"

# Set up auto-run if not already present
SHELL_NAME="$(basename "$SHELL")"
echo "🛠 Configuring shell for auto-run (detected: $SHELL_NAME)..."

AUTO_RUN='[ -x /usr/local/bin/terminal-love.sh ] && /usr/local/bin/terminal-love.sh'

case "$SHELL_NAME" in
  bash)
    FILE="$HOME/.bashrc"
    ;;
  zsh)
    FILE="$HOME/.zshrc"
    ;;
  fish)
    FILE="$HOME/.config/fish/config.fish"
    AUTO_RUN='test -x /usr/local/bin/terminal-love.sh; and /usr/local/bin/terminal-love.sh'
    ;;
  *)
    echo "⚠️ Unsupported shell: $SHELL_NAME — please add the launch line manually."
    FILE=""
    ;;
esac

if [[ -n "$FILE" && -f "$FILE" && ! $(grep -F "terminal-love.sh" "$FILE") ]]; then
  echo "$AUTO_RUN" >> "$FILE"
  echo "✅ Added to $FILE"
else
  echo "ℹ️ Launch line already present or unsupported shell."
fi

echo "🎉 Terminal Love installed successfully!"
echo "💡 Restart your terminal to see the magic."
