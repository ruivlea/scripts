#!/bin/sh
echo change this live root password first.
passwd

swapoff /dev/sda2

mkfs.fat -F 32 /dev/sda1
fatlabel /dev/sda1 BOOT
mkswap -L SWAP /dev/sda2
mkfs.ext4 -L ROOT /dev/sda3
mkfs.ext4 -L HOME /dev/sda4

swapon /dev/sda2
mount /dev/sda3 /mnt
mkdir /mnt/boot
mkdir /mnt/home
mount /dev/sda1 /mnt/boot
mount /dev/sda4 /mnt/home

basestrap /mnt base base-devel dinit elogind-dinit linux linux-firmware efibootmgr

fstabgen -U /mnt >> /mnt/etc/fstab

cp artix-install-chroot.sh /mnt/root/

artix-chroot /mnt /bin/bash -e /root/artix-install-chroot.sh
