#!/usr/bin/env bash
set -e

echo "🎨 Setup Window Manager & Configs..."

# Install Sway, Terminal, Bar, File Manager, Fonts
sudo apt install -y sway swaybg swayidle xwayland foot waybar wofi thunar alacritty pulseaudio fonts-font-awesome fonts-jetbrains-mono brightnessctl grim slurp jq

# Copy Konfigurasi
echo "📁 Copy konfigurasi ke .config"
mkdir -p ~/.config
cp -r .config/* ~/.config/

# Copy Fonts Tambahan
echo "🔤 Copy fonts tambahan"
mkdir -p ~/.local/share/fonts
cp -r .local/share/fonts/* ~/.local/share/fonts/
fc-cache -fv

# Copy Desktop Entry kalau ada
echo "📁 Copy aplikasi ke ~/.local/share/applications"
mkdir -p ~/.local/share/applications
cp -r .local/share/applications/* ~/.local/share/applications/
update-desktop-database ~/.local/share/applications

echo "✅ Setup Window Manager selesai. Jalankan 'sway' untuk mulai."
