#!/usr/bin/env bash
set -e

echo "🧹 Starting Full Cleanup..."

# 1. Clean APT Cache
echo "🧹 Cleaning APT cache..."
sudo apt clean
sudo rm -rf /var/lib/apt/lists/*
sudo rm -rf /var/cache/apt/archives/*

# 2. Clean Snap Cache (Kalau ada)
echo "🧹 Cleaning Snap cache..."
sudo rm -rf /var/lib/snapd/snaps/*
sudo rm -rf ~/snap

# 3. Hapus Source Code Build-an yang Umum
echo "🧹 Removing leftover source code..."
sudo rm -rf ~/ly
sudo rm -rf ~/swayfx
sudo rm -rf ~/wlroots
sudo rm -rf ~/subprojects
sudo rm -rf ~/build
sudo rm -rf ~/Downloads/*
sudo rm -rf /opt/runflux-setup/temporary-build

# 4. Clean Log System
echo "🧹 Cleaning system logs..."
sudo journalctl --vacuum-time=1s
sudo rm -rf /var/log/*

# 5. Clean Temporary Files
echo "🧹 Cleaning /tmp..."
sudo rm -rf /tmp/*

# 6. Clean History User
echo "🧹 Cleaning history..."
rm -rf ~/.bash_history ~/.zsh_history ~/.cache ~/.npm ~/.wget-hsts
sudo rm -rf /root/.bash_history /root/.cache

# 7. Clean Thumbnail Cache
echo "🧹 Cleaning thumbnails..."
rm -rf ~/.cache/thumbnails/*

# 8. Optional: Remove Build Tools kalau Produksi
# echo "🧹 Optional: Removing build tools..."
# sudo apt purge -y build-essential meson ninja-build cmake gcc g++ make
# sudo apt autoremove -y

# 9. Rebuild Font Cache
echo "🧹 Rebuilding font cache..."
fc-cache -fv

echo "✅ Cleanup selesai. ISO atau sistem jadi lebih ramping."
