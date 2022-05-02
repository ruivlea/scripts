#!/bin/sh
efibootmgr --disk /dev/sda --part 1 --create --label "Obarun" --loader vmlinuz-linux --unicode 'root=/dev/sda3 rw quiet initrd=intel-ucode.img initrd=initramfs-linux.img' --verbose
