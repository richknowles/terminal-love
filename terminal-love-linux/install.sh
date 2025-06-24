#!/bin/bash
echo "📦 Installing Terminal Love..."

BIN_DIR="/usr/local/bin"
TMP_DIR=$(mktemp -d)

echo "📥 Downloading files..."
curl -fsSL https://raw.githubusercontent.com/richknowles/terminal-love/main/terminal-love-linux/terminal-love.sh -o "$TMP_DIR/terminal-love.sh"
curl -fsSL https://raw.githubusercontent.com/richknowles/terminal-love/main/terminal-love-linux/terminal-love-network.sh -o "$TMP_DIR/terminal-love-network.sh"

echo "🧹 Cleaning up old files in $BIN_DIR..."
sudo rm -f "$BIN_DIR/terminal-love.sh" "$BIN_DIR/terminal-love-network.sh"

echo "📤 Installing to $BIN_DIR..."
sudo install -m 755 "$TMP_DIR/terminal-love.sh" "$BIN_DIR/terminal-love.sh"
sudo install -m 755 "$TMP_DIR/terminal-love-network.sh" "$BIN_DIR/terminal-love-network.sh"

echo "✅ Done."
