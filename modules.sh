#!/bin/bash

updateSystem () {
    sudo xbps-install -S xbps -y
    sudo xbps-install -Syu
}

placeVitalFiles () {
    # xinitrc
    rm ~/.xinitrc
    ln -sf "$(pwd)"/configuration-files/.xinitrc /home/"$USER"/

    # place .bashrc in home
    rm /home/"$USER"/.bashrc
    ln -sf "$(pwd)"/configuration-files/.bashrc /home/"$USER"/
}

installVitalPackages () {
    sudo xbps-install -S git -y
    sudo xbps-install -S curl -y
    sudo xbps-install -S wget -y
    sudo xbps-install -S xz -y
    sudo xbps-install -S unzip -y
    sudo xbps-install -S zip -y
    sudo xbps-install -S gptfdisk -y
    sudo xbps-install -S xtools -y
    sudo xbps-install -S mtools -y
    sudo xbps-install -S mlocate -y
    sudo xbps-install -S fuse-exfat -y
    sudo xbps-install -S linux-headers -y
    sudo xbps-install -S ffmpeg -y
    sudo xbps-install -S htop -y
    sudo xbps-install -S neofetch -y
    sudo xbps-install -S arc-theme -y
    sudo xbps-install -S bash-completion -y
    sudo xbps-install -S feh -y
    sudo xbps-install -S gparted -y
    sudo xbps-install -S lxappearance -y
    sudo xbps-install -S mpv -y
    sudo xbps-install -S neovim -y
    sudo xbps-install -S sxiv -y
    sudo xbps-install -S arandr -y
    sudo xbps-install -S vsv -y
    sudo xbps-install -S ntfs-3g -y
    sudo xbps-install -S unclutter-xfixes -y
}

createPARAfolderStructure () {
    ## remove all empty unnecessary files
    rmdir ~/*
    ## create folder structure
    # mkdir -p ~/project
    mkdir -p ~/area
    mkdir -p ~/resource/appimage
    mkdir -p ~/resource/wallpaper
    mkdir -p ~/archive
}

installDoomEmacs () {
    sudo xbps-install -S emacs-x11 -y
    sudo xbps-install -S ripgrep -y
    sudo xbps-install -S fd -y
    mkdir ~/.config/doom
    git clone --depth 1 https://github.com/doomemacs/doomemacs ~/.config/emacs
    ~/.config/emacs/bin/doom install
    sudo ln -s /home/"$USER"/.config/emacs/bin/doom /bin/
    ln -s "$(pwd)"/configuration-files/doom-emacs-conf-files/config.el /home/"$USER"/.config/doom/
    ln -s "$(pwd)"/configuration-files/doom-emacs-conf-files/init.el /home/"$USER"/.config/doom/
    ln -s "$(pwd)"/configuration-files/doom-emacs-conf-files/packages.el /home/"$USER"/.config/doom/
    ln -s "$(pwd)"/configuration-files/doom-emacs-conf-files/gravatar-savolla.png /home/"$USER"/.config/doom/
}

installFiracodeFont () {
    sudo xbps-install -S font-fira-otf -y
    sudo xbps-install -S font-fira-ttf -y
    sudo xbps-install -S font-firacode -y
}

installGoProgrammingLanguage () {
    sudo xbps-install -S go -y
    go install github.com/x-motemen/gore/cmd/gore@latest
    go install github.com/cweill/gotests@latest
    go install github.com/fatih/gomodifytags@latest
}

installWebDevStuff () {
    sudo xbps-install -S nodejs -y
    sudo xbps-install -S jq -y
    sudo xbps-install -S tidy5 -y
    sudo npm install stylelint -g
    sudo npm install js-beautify -g
    sudo npm install -g live-server -y
    sudo xbps-install -S shfmt -y
    sudo xbps-install -S shellcheck -y
}

installProgrammingHelperTools () {
    sudo xbps-install -S nodejs -y
    sudo xbps-install -S cmake -y
    sudo xbps-install -S base-devel -y
    sudo xbps-install -S the_silver_searcher -y
    sudo xbps-install -S tmux -y
    sudo xbps-install -S gcolor3 -y
    sudo xbps-install -S gpick -y
    sudo npm install marked -g
    sudo xbps-install -S autoconf -y
    sudo xbps-install -S automake -y
    sudo xbps-install -S bison -y
    sudo xbps-install -S m4 -y
    sudo xbps-install -S make -y
    sudo xbps-install -S libtool -y
    sudo xbps-install -S flex -y
    sudo xbps-install -S meson -y
    sudo xbps-install -S ninja -y
    sudo xbps-install -S optipng -y
    sudo xbps-install -S sassc -y

}

installRust () {
    sudo xbps-install -S rust-analyzer -y
    sudo xbps-install -S cargo -y
    sudo xbps-install -S rustc -y
}

installJava () {
    sudo xbps-install -S openjdk -y
}

installRuby () {
    sudo xbps-install -S ruby -y
}


installDwm () {
    sudo xbps-install -S xorg -y
    sudo xbps-install -S dmenu -y
    sudo xbps-install -S dwm -y
    sudo xbps-install -S st -y
    sudo xbps-install -S slock -y
}

installGnome () {
    sudo xbps-install -S xorg -y
    sudo xbps-install -S gnome -y
    sudo xbps-install -S gdm -y
    sudo xbps-install -Rs xdg-desktop-portal xdg-desktop-portal-gtk xdg-user-dirs xdg-user-dirs-gtk xdg-utils
    sudo xbps-install gnome-browser-connector
    sudo xbps-install NetworkManager NetworkManager-openvpn NetworkManager-openconnect NetworkManager-vpnc NetworkManager-l2tp
    sudo rm /var/service/wpa_supplicant
    sudo rm /var/service/dhcpcd
    sudo ln -sv /etc/sv/NetworkManager /var/service
    setupPulseaudio
}

enablePSD () {
    git clone https://github.com/madand/runit-services
    cd runit-services || exit
    sudo mv psd /etc/sv/
    sudo ln -s /etc/sv/psd /var/service/
    sudo chmod +x etc/sv/psd/*
}

installThunar () {
    sudo xbps-install -S Thunar -y
    sudo xbps-install -S thunar-volman -y
}

installFirefox () {
    sudo xbps-install -S firefox -y
}

installTransmission () {
    sudo xbps-install -S transmission-gtk -y
}

installRanger () {
    sudo xbps-install -S ranger -y
    sudo xbps-install -S w3m -y
    sudo xbps-install -S w3m-img -y
}

installDocker () {
    sudo xbps-install -S docker -y
    sudo ln -sf /etc/sv/docker/ /var/service/

    sudo xbps-install -S go -y
    go install github.com/jessfraz/dockfmt@latest # for doom emacs
}

enableBluetooth () {
    sudo xbps-install -S bluez -y
    sudo usermod -aG bluetooth "$USER"
    sudo xbps-install -S dbus -y
    sudo ln -sf /etc/sv/dbus/ /var/service/
    sudo ln -sf /etc/sv/bluetoothd/ /var/service/
}

setupAlsa () {
    sudo usermod -aG audio "$USER"
    sudo xbps-install -S bluez-alsa -y
    sudo ln -sf /etc/sv/bluez-alsa/ /var/service/
}

setupPipewire () {
    sudo usermod -aG audio "$USER"
    sudo xbps-install -S pipewire -y
    sudo xbps-install -S wireplumber-elogind -y
    sudo xbps-install -S libspa-bluetooth -y
    sudo mkdir -p /etc/pipewire/pipewire.conf.d
    sudo ln -sf /usr/share/examples/wireplumber/10-wireplumber.conf /etc/pipewire/pipewire.conf.d/
}

setupPulseaudio () {
    sudo usermod -aG audio "$USER"
    sudo xbps-install -S pulseaudio -y
    sudo xbps-install -S pulseaudio-utils -y
    sudo xbps-install -S pulsemixer -y
    sudo xbps-install -S alsa-plugins-pulseaudio -y
    sudo xbps-install -S dbus -y
    sudo ln -sf /etc/sv/dbus/ /var/service/
}


installXdgRelatedStuff () {
    sudo xbps-install -S xdg-utils -y
    sudo xbps-install -S xdg-desktop-portal -y
    sudo xbps-install -S xdg-desktop-portal-gtk -y
    sudo xbps-install -S xdg-user-dirs -y
    sudo xbps-install -S xdg-user-dirs-gtk -y
}

enableVitalServices () {
    sudo xbps-install -S dbus -y
    sudo ln -sf /etc/sv/dbus/ /var/service/
    sudo ln -sf /etc/sv/polkitd/ /var/service/
    sudo xbps-install -S elogind -y
    sudo ln -sf /etc/sv/elogind /var/service/ # needed for redirecting usb devices into vms
}

enableVideoAcceleration () {
    sudo xbps-install -Rs mesa-vdpau mesa-vaapi -y
}

installProprietaryNvidiaDrivers () {
    xbps-install -Sy void-repo-nonfree -y
    xbps-install -S nvidia -y
}

enableNixPackageManager () {
    sudo xbps-install -S nix -y
    sudo ln -sf /etc/sv/nix-daemon /var/service
    sudo nix-channel --add https://nixos.org/channels/nixpkgs-unstable
    sudo nix-channel --update
}

installLogseq () {
    enableNixPackageManager
    export NIXPKGS_ALLOW_INSECURE=1
    nix-env -iA nixpkgs.logseq
    sudo chmod +x "$(pwd)"/configuration-files/nix-programs/logseq
    sudo ln -sf "$(pwd)"/configuration-files/nix-programs/logseq /bin/
}

installLibrewolf () {
    enableNixPackageManager
    nix-env -iA nixpkgs.librewolf
    sudo chmod +x "$(pwd)"/configuration-files/nix-programs/librewolf
    sudo ln -sf "$(pwd)"/configuration-files/nix-programs/librewolf /bin/
}

setupKVM () {
    ## setup libvirt
    sudo xbps-install -S virt-manager libvirt qemu bridge-utils iptables -y
    sudo ln -sf "$(pwd)"/configuration-files/libvirt.conf /etc/libvirt/
    sudo ln -sf "$(pwd)"/configuration-files/qemu.conf /etc/libvirt/
    sudo ln -sf /etc/sv/libvirtd /var/service
    sudo ln -sf /etc/sv/virtlockd /var/service
    sudo ln -sf /etc/sv/virtlogd /var/service
    sudo gpasswd -a "$USER" libvirt
    sudo usermod -a -G libvirt,kvm "$USER"
    sudo xbps-install -S spice-vdagent -y
    sudo xbps-install -S virt-viewer -y
}

enableAutoMountingDisks () {
    sudo xbps-install -S udiskie -y
    sudo xbps-install -S python3-distutils-extra -y # needed for udiskie to work
    sudo cp "$(pwd)"/configuration-files/10-udisks2.rules /etc/polkit-1/rules.d/
}

enableHotKeyDaemon () {
    sudo xbps-install -S sxhkd -y
    mkdir /home/"$USER"/.config/sxhkd
    ln -sf "$(pwd)"/configuration-files/sxhdkrc /home/"$USER"/.config/sxhkd/
}

enableRedshift () {
    sudo xbps-install -S redshift -y
    ln -sf "$(pwd)"/configuration-files/redshift.conf /home/"$USER"/.config/
}

enableTapToClick () {
    sudo mkdir /etc/X11/xorg.conf.d
    sudo ln -sf "$(pwd)"/configuration-files/30-touchpad.conf /etc/X11/xorg.conf.d/
}

disableSSH () {
    sudo rm /var/service/sshd
}

removeXbpsCache () {
    sudo xbps-remove -Oo -y
}

installEmpttyLoginManager () {
    sudo xbps-install -S emptty -y
    sudo rm /etc/emptty/conf
    sudo ln -sf "$(pwd)"/configuration-files/conf /etc/emptty/
}

