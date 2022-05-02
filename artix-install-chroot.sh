#!/bin/sh
echo set root password:
passwd

ln -sf /usr/share/zoneinfo/Asia/Jakarta /etc/localtime
hwclock --systohc

sed -i '#en_US.UTF-8 UTF-8/en_US.UTF-8 UTF-8/g' /etc/locale.gen
locale-gen

efibootmgr --disk /dev/sda --part 1 --create --label "Artix" --loader vmlinuz-linux --unicode 'root=/dev/sda3 rw quiet initrd=initramfs-linux.img' --verbose

touch /etc/hostname
echo artix > /etc/hostname
echo 127.0.1.1 artix.localdomain artix >> /etc/hosts

pacman -S dhcpcd-dinit iwd-dinit ntfs-3g

echo installation finish. please reboot then run artix-post-install.sh, and artix-post-install-user.sh after that.
