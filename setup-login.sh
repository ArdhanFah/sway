#!/usr/bin/env bash
set -e

echo "🔒 Install LY Login Manager..."

# Update dan dependencies
sudo apt update
sudo apt install -y build-essential git libpam0g-dev libxcb-xkb-dev libxkbcommon-dev libxcb1-dev libxcb-util0-dev libevdev-dev libudev-dev libxcb-xtest0-dev snapd

# Install Zig via Snap
sudo snap install zig --beta --classic

# Clone dan build LY
git clone https://codeberg.org/AnErrupTion/ly.git
cd ly
zig build
sudo zig build installexe

# Enable LY service
sudo systemctl enable ly.service

# Tambah user ke grup video & input kalau diperlukan
sudo usermod -aG video,input "$USER"

cd ..
sudo rm -rf ~/ly

echo "🧹 Source LY sudah dibersihkan."
echo "✅ LY Login Manager selesai diinstall. Reboot untuk tes."
