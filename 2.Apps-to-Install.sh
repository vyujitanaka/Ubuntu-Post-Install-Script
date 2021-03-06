#!/bin/bash

###################
# Apps to Install #
###################

# System Update
sudo apt update

# Ubuntu & Pop!_OS Apps
sudo apt install -y gnome-tweaks gparted synaptic gufw hardinfo dconf-editor baobab autokey-gtk virtualbox neofetch htop net-tools ffmpeg clamav clamav-daemon libclamunrar9 ttf-mscorefonts-installer flameshot grub-customizer

# PPA's Apps from Launchpad
## Adding Papirus Icons
sudo add-apt-repository ppa:papirus/papirus -y
## Adding qBittorrent
sudo add-apt-repository ppa:qbittorrent-team/qbittorrent-stable -y
## Adding Git
sudo add-apt-repository ppa:git-core/ppa -y
## Adding Cryptomator
sudo add-apt-repository ppa:sebastian-stenzel/cryptomator -y
## Adding KeePassXC
sudo add-apt-repository ppa:phoerious/keepassxc -y
## Adding OBS Studio
### sudo add-apt-repository ppa:obsproject/obs-studio -y
### System Update
sudo apt update -qq
#### Installing the Programs
sudo apt install -y papirus-icon-theme qbittorrent git cryptomator keepassxc

# PPA's Apps from Other Sources
## Adding Amazon Corretto 11
wget -O- https://apt.corretto.aws/corretto.key | sudo apt-key add -
sudo add-apt-repository 'deb https://apt.corretto.aws stable main'
## Adding Brave Browser
sudo apt install apt-transport-https curl
sudo curl -fsSLo /usr/share/keyrings/brave-browser-archive-keyring.gpg https://brave-browser-apt-release.s3.brave.com/brave-browser-archive-keyring.gpg
echo "deb [signed-by=/usr/share/keyrings/brave-browser-archive-keyring.gpg arch=amd64] https://brave-browser-apt-release.s3.brave.com/ stable main"|sudo tee /etc/apt/sources.list.d/brave-browser-release.list
## Adding GitHub Desktop - The Linux Fork
### wget -qO - https://packagecloud.io/shiftkey/desktop/gpgkey | sudo tee /etc/apt/trusted.gpg.d/shiftkey-desktop.asc > /dev/null
### sudo sh -c 'echo "deb [arch=amd64] https://packagecloud.io/shiftkey/desktop/any/ any main" > /etc/apt/sources.list.d/packagecloud-shiftky-desktop.list'
### System Update
sudo apt update -qq
#### Installing the Programs
sudo apt install -y java-common java-11-amazon-corretto-jdk default-jre brave-browser

## IntelliJ IDEA
### sudo snap install intellij-idea-community --classic

# Flatpak Update
flatpak update -y

# Flatpak Apps
## VLC
flatpak install flathub org.videolan.VLC -y
## AnyDesk
flatpak install flathub com.anydesk.Anydesk -y
## Tor Browser
flatpak install flathub com.github.micahflee.torbrowser-launcher -y
## GIMP
flatpak install flathub org.gimp.GIMP -y
## Meld
flatpak install flathub org.gnome.meld -y
## Audacity
flatpak install flathub org.audacityteam.Audacity -y

# Flatpak Clean Up
flatpak uninstall --delete-data -y
flatpak uninstall --unused -y

# Some Other Settings
## Permanently enable Do Not Disturb (No Notifications)
gsettings set org.gnome.desktop.notifications show-banners false
## Permanently disable Bluetooth
sudo systemctl disable bluetooth.service
## Enable Hidden Startup Programs
sudo sed -i 's/NoDisplay=true/NoDisplay=false/g' /etc/xdg/autostart/*.desktop

# Finishing Things Up
## System Update and Upgrade
sudo apt update 
sudo apt upgrade -y
sudo apt dist-upgrade -y
## System Clean Up
sudo apt install -f
sudo apt autoremove -y
sudo apt autoclean
sudo apt clean

# End of Script

# Display Installation Complete Message
echo "All done :)" 
echo "Please, restart the computer, clean up your system using BleachBit (if you want) and then restart the computer again."