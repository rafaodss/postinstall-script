#!/bin/bash

#SCRIPT DE PÓS INSTALAÇÃO PARA DISTROS UBUNTU/DEBIAN
#POST INSTALL SCRIP FOR UBUNTU/DEBIAN DISTROS

echo "##################################################"
echo "Updating system..."
echo "##################################################"
sudo apt update -y
sudo apt upgrade -y
sudo apt dist-upgrade -y
pkcon update

echo "##################################################"
echo "Installing Google Chrome..."
echo "##################################################"
wget -cO chrome.deb https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
sudo apt install -y ./chrome.deb

echo "##################################################"
echo "Installing Discord..."
echo "##################################################"   
wget -cO discord.deb https://discordapp.com/api/download?platform=linux&format=deb
sudo apt install -y ./discord.deb

echo "##################################################"
echo "Installing VirtualBox..."
echo "##################################################"
wget -cO virtualbox.deb https://download.virtualbox.org/virtualbox/6.0.12/virtualbox-6.0_6.0.12-133076~Ubuntu~bionic_amd64.deb
sudo apt install -y ./virtualbox.deb

echo "##################################################"
echo "Enabling support for Flatpak and Snap..."
echo "##################################################"
sudo apt install flatpak -y
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
sudo apt install snapd -y

echo "##################################################"
echo "Replacing Gimp repo version for Flatpak version..."
echo "##################################################"
sudo apt remove gimp -y
flatpak install flathub org.gimp.GIMP

echo "##################################################"
echo "Installing Telegram..."
echo "##################################################"
flatpak install flathub org.telegram.desktop

echo "##################################################"
echo "Installing Lollypop..."
echo "##################################################"
flatpak install flathub org.gnome.Lollypop

echo "##################################################"
echo "Installing Lollypop..."
echo "##################################################"
flatpak install flathub org.gnome.Lollypop

echo "##################################################"
echo "Installing Calibre..."
echo "##################################################"
flatpak install flathub com.calibre_ebook.calibre

echo "##################################################"
echo "Installing Gparted..."
echo "##################################################"
sudo apt install gparted -y

echo "##################################################"
echo "Installing vlc..."
echo "##################################################"
sudo apt install vlc -y

echo "##################################################"
echo "Installing qBittorrent..."
echo "##################################################"
sudo apt install qbittorrent -y

echo "##################################################"
echo "Installing MySQL Workbench..."
echo "##################################################"
sudo apt install mysql-workbench-community -y

echo "##################################################"
echo "Installing Python 3, pip and Django..."
echo "##################################################"
sudo apt install python3 -y
sudo apt install python3-pip -y
sudo apt install python3-django -y

echo "##################################################"
echo "Installing Okular..."
echo "##################################################"
sudo apt install okular -y

echo "##################################################"
echo "Installing Steam..."
echo "##################################################"
sudo apt install steam -y

echo "##################################################"
echo "Installing neofetch..."
echo "##################################################"
sudo apt install neofetch -y

echo "##################################################"
echo "Installing Synaptic..."
echo "##################################################"
sudo apt install synaptic -y

echo "##################################################"
echo "Installing Microsoft Fonts..."
echo "##################################################"
sudo apt install ttf-mscorefonts-installer -y

echo "##################################################"
echo "Removing some programs..."
echo "##################################################"
sudo apt remove rhythmbox thunderbird transmission pidgin hexchat cheese pix -y

echo "##################################################"
echo "Package cleaning and removal..."
echo "##################################################"
sudo apt autoremove -y
sudo apt autoclean -y

if [ `echo $XDG_CURRENT_DESKTOP` = "KDE" ];
then
    echo "##################################################"
    echo "Enabling video thumbnails for Dolphin..."
    echo "##################################################"
    sudo apt install ffmpegthumbs ffmpegthumbnailer -y
    
    echo "##################################################"
    echo "Installation and configuration of Latte Dock..."
    echo "##################################################"
    sudo apt install latte-dock -y
    mkdir -p ~/.config/latte
    mv Deepin.layout.latte ~/.config/latte/
    echo "[ModifierOnlyShortcuts]
Meta=org.kde.lattedock,/Latte,org.kde.LatteDock,activateLauncherMenu" >> ~/.config/kwinrc
fi

echo "##################################################"
echo "Installing Anki..."
echo "##################################################"
sudo apt install ttf-mscorefonts-installer -y
wget https://github.com/ankitects/anki/releases/download/2.1.26/anki-2.1.26-linux-amd64.tar.bz2
tar xjf /anki-2.1.26-linux-amd64.tar.bz2
cd anki-2.1.26-linux-amd64
sudo make install -y

echo "##################################################"
echo "Installing Lutris..."
echo "##################################################"
wget -cO lutris.deb https://download.opensuse.org/repositories/home:/strycore/Debian_10/amdu64/lutris_0.5.7.1_amd64.deb
sudo apt install -y ./lutris.deb

echo "##################################################"
echo "Installing Lutris..."
echo "##################################################"
wget -cO stremio.deb https://dl.strem.io/shell-linux/v4.4.116/stremio_4.4.116-1_amd64.deb
sudo apt install -y ./stremio.deb

echo "##################################################"
echo "Adding repository for mesa driver Kisak..."
echo "##################################################"
sudo apt-add-repository ppa:kisak/kisak-mesa -y
sudo apt update && sudo apt upgrade
pkcon update

echo "##################################################"
echo "This is the end..."
echo "##################################################"
