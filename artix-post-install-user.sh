#!/bin/sh
git clone https://github.com/Ruivlea/dotfiles.git

mkdir mtp

cd dotfiles
tar -cf $HOME/dotfiles.tar .

cd $HOME
tar -xf dotfiles.tar

rm -rf dotfiles dotfiles.tar

cd firefox-privacy
echo will install vendor.js and policies.json for firefox privacy
sudo sh install

cd $HOME

firefox -CreateProfile "$USER $HOME/.mozilla/firefox/$USER"
firefox -CreateProfile "alt $HOME/.mozilla/firefox/alt"

cp -r firefox-privacy/chrome $HOME/.mozilla/firefox/$USER/
cp -r firefox-privacy/chrome $HOME/.mozilla/firefox/alt/

rm -rf firefox-privacy

cd .icons
tar -xf Nordzy-cursors.tar.gz
sudo cp -r Nordzy-cursors /usr/share/icons/
rm Nordzy-cursors.tar.gz
rm -rf Nordzy-cursors

tar -xf Nordzy.tar.gz
sudo cp -r Nordzy /usr/share/icons/
sudo cp -r Nordzy-dark /usr/share/icons/
rm Nordzy.tar.gz
rm -rf Nordzy
rm -rf Nordzy-dark

rm tango-plus.tar.gz
rm update-tango-plus-system-wide.sh

cd $HOME/.themes
tar -xf Nordic-darker.tar.gz
sudo mv -f Nordic-darker /usr/share/themes/
rm Nordic-darker.tar.gz

cd $HOME
rm -rf .themes

sudo cp etc/dinit.d/freshclam /etc/dinit.d/
sudo cp etc/dnscrypt-proxy/* /etc/dnscrypt-proxy/
sudo cp etc/lightdm/lightdm-gtk-greeter.conf /etc/lightdm/
rm -rf etc/dinit.d etc/dnscrypt-proxy etc/lightdm
sudo dinitctl enable freshclam

rm -rf etc

sudo mv -f usr/share/X11/xorg.conf.d/40-libinput.conf /usr/share/X11/xorg.conf.d/

rm -rf usr/share/X11

sudo rm -rf usr

cd $HOME/sources/st
makepkg -si
rm *.zst
rm -rf src
rm -rf pkg

cd $HOME/sources/jmtpfs-git
makepkg -si
rm *.zst
rm -rf src
rm -rf pkg

cd $HOME
rm .jwmrc
chmod u+x $HOME/scripts/*

echo will edit resolvconf, please enter root password, not sudo.
su -c "echo \"nameserver 127.0.0.1
options edns0\" > /etc/resolv.conf" root

sudo chattr +i /etc/resolv.conf

sudo dinitctl enable dnscrypt-proxy
sudo dinitctl enable lightdm
