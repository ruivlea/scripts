#!/bin/sh
pacman -Syu

pacman -S artix-archlinux-support

echo "
#archlinux
[extra]
Include = /etc/pacman.d/mirrorlist-arch

[community]
Include = /etc/pacman.d/mirrorlist-arch" >> /etc/pacman.conf

pacman-key --populate archlinux

pacman -Syu

pacman -S xorg-server ttf-droid openbox sxhkd xclip xautolock i3lock firefox dmenu sdl2 ksnip inkscape libreoffice-fresh neovim dnscrypt-proxy-dinit clamav-dinit chrony-dinit lightdm-dinit lightdm-gtk-greeter git aria2 pcmanfm-qt tint2 unrar zip unzip lxqt-archiver mpv sxiv brightnessctl pulseaudio pavucontrol volumeicon gsimplecal qt5ct mandoc nvidia picom gvfs xdotool

dinitctl enable chronyd
dinitctl enable dhcpcd

useradd -m ruivlea
echo set ruivlea password:
passwd ruivlea

usermod -aG wheel ruivlea
usermod -aG video ruivlea

ln -sf /usr/bin/nvim /usr/bin/vi

visudo
