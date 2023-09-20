## remove all empty unnecessary files
rmdir ~/*
## create folder structure
mkdir -p ~/project
mkdir -p ~/area
mkdir -p ~/resource/appimage
mkdir -p ~/resource/wallpaper
mkdir -p ~/archive

# place .bashrc in home
rm /home/"$USER"/.bashrc
ln -s "$(pwd)"/configuration-files/.bashrc /home/"$USER"/

# prevent go packages to be installed in $HOME (prevent clutter)
export GOPATH=$HOME/area/go
export PATH=$PATH:$GOROOT/bin:$GOPATH/bin

## install needed packages
sudo xbps-install -S git curl htop neofetch emptty \
    arc-theme base-devel bash-completion clang cmake \
    dmenu dwm emacs-x11 fd feh firefox font-fira-otf \
    font-fira-ttf font-firacode go gparted jq lxappearance \
    mpv neovim nodejs ranger ripgrep sxiv st thunar-volman \
    tmux transmission-gtk udiskie w3m w3m-img

## install doom emacs deps for development
# install java deps
sudo xbps-install -S openjdk

# install ruby deps
sudo xbps-install -S ruby

# install rust deps for doom emacs
sudo xbps-install -S rust-analyzer

# install shell dependencies for shell/bash stuff
sudo xbps-install -S shfmt
sudo xbps-install -S shellcheck

# install web dependencies for html/css/js stuff
sudo xbps-install -S tidy5
sudo npm install stylelint -g
sudo npm install js-beautify -g

# install python deps for doom emacs
sudo pip install black

# install markdown compiler for doom emacs
sudo npm install marked -g

# install rest module deps for doom emacs
sudo xbps-install -S jq

# install go module deps
go install github.com/x-motemen/gore/cmd/gore@latest
go install github.com/cweill/gotests@latest
go install github.com/fatih/gomodifytags@latest

# put all doom emacs configuration files in place
mkdir ~/.config/doom
ln -s "$(pwd)"/configuration-files/doom-emacs-conf-files/config.el /home/"$USER"/.config/doom/
ln -s "$(pwd)"/configuration-files/doom-emacs-conf-files/init.el /home/"$USER"/.config/doom/
ln -s "$(pwd)"/configuration-files/doom-emacs-conf-files/packages.el /home/"$USER"/.config/doom/

## installing Doom emacs
git clone --depth 1 https://github.com/doomemacs/doomemacs ~/.config/emacs
~/.config/emacs/bin/doom install

# emptty configuration
sudo rm /etc/emptty/conf
sudo ln -s "$(pwd)"/configuration-files/conf /etc/emptty/

# xinitrc
rm ~/.xinitrc
ln -s "$(pwd)"/configuration-files/.xinitrc /home/"$USER"/

# set wallpaper
ln -s "$(pwd)"/media/wallpaper /home/"$USER"/resource/wallpaper/
