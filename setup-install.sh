#!/usr/bin/env bash
set -e

echo "🚀 Starting Full RunfluxOS Setup..."

sudo apt update && sudo apt upgrade -y

echo "🔧 Setup Tools..."
./setup-tools.sh

echo "🔧 Setup Apps (Brave, VSCode, Spotify)..."
./setup-apps.sh

echo "🎨 Setup Window Manager & Configs..."
./setup-wm.sh

echo "🔒 Setup Login Manager..."
./setup-login.sh

echo "🔧 Setup MOTD..."
./setup-motd.sh

echo "✅ Semua setup selesai. Disarankan reboot!"
