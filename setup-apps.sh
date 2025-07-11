#!/usr/bin/env bash

set -e  # Stop kalau ada error

echo "===> Update dan install dependencies dasar..."
sudo apt update
sudo apt install -y curl wget gpg apt-transport-https

### ------------------------------
### Install Brave Browser
### ------------------------------
echo "===> Cek Brave Browser..."

if ! command -v brave-browser >/dev/null 2>&1; then
    echo "Brave belum terpasang, install sekarang..."

    if [ ! -f /etc/apt/keyrings/brave-browser-archive-keyring.gpg ]; then
        sudo mkdir -p /etc/apt/keyrings
        sudo curl -fsSLo /etc/apt/keyrings/brave-browser-archive-keyring.gpg \
            https://brave-browser-apt-release.s3.brave.com/brave-browser-archive-keyring.gpg
    fi

    if [ ! -f /etc/apt/sources.list.d/brave-browser-release.list ]; then
        echo "deb [signed-by=/etc/apt/keyrings/brave-browser-archive-keyring.gpg] https://brave-browser-apt-release.s3.brave.com/ stable main" \
            | sudo tee /etc/apt/sources.list.d/brave-browser-release.list
    fi

    sudo apt update
    sudo apt install -y brave-browser
else
    echo "Brave sudah terpasang, skip."
fi

### ------------------------------
### Install VSCode
### ------------------------------
echo "===> Cek VSCode..."

if ! command -v code >/dev/null 2>&1; then
    echo "VSCode belum terpasang, install sekarang..."

    if [ ! -f /etc/apt/keyrings/microsoft.gpg ]; then
        wget -qO- https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor | sudo tee /etc/apt/keyrings/microsoft.gpg > /dev/null
    fi

    if [ ! -f /etc/apt/sources.list.d/vscode.list ]; then
        echo "deb [arch=amd64,arm64,armhf signed-by=/etc/apt/keyrings/microsoft.gpg] https://packages.microsoft.com/repos/code stable main" \
            | sudo tee /etc/apt/sources.list.d/vscode.list
    fi

    sudo apt update
    sudo apt install -y code
else
    echo "VSCode sudah terpasang, skip."
fi

### ------------------------------
### Install Spotify
### ------------------------------
echo "===> Cek Spotify..."

if ! command -v spotify >/dev/null 2>&1; then
    echo "Spotify belum terpasang, install sekarang..."

    if [ ! -f /etc/apt/keyrings/spotify-archive-keyring.gpg ]; then
	curl -sS https://download.spotify.com/debian/pubkey_C85668DF69375001.gpg | gpg --dearmor | sudo tee /etc/apt/keyrings/spotify-archive-keyring.gpg > /dev/null
    fi

    if [ ! -f /etc/apt/sources.list.d/spotify.list ]; then
	echo "deb [signed-by=/etc/apt/keyrings/spotify-archive-keyring.gpg] http://repository.spotify.com stable non-free" | sudo tee /etc/apt/sources.list.d/spotify.list
    fi

    sudo apt update
    sudo apt install -y spotify-client
else
    echo "Spotify sudah terpasang, skip."
fi

echo "===> Semua proses selesai!"
