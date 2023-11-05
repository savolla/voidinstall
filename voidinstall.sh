#!/bin/bash
source modules.sh
source voidinstall.conf

updateSystem
placeVitalFiles
installVitalPackages
enableVitalServices

if [ $DWM -eq 1 ]; then
    installDwm
fi

if [ $GNOME -eq 1 ]; then
    # reset audio
    USE_ALSA=0
    USE_PIPEWIRE=0
    USE_PULSEAUDIO=0
    installGnome
fi

if [ $CREATE_PARA_FOLDER_STRUCTURE -eq 1 ]; then
    createPARAfolderStructure
fi

if [ $INSTALL_DOOM_EMACS -eq 1 ]; then
    installDoomEmacs
fi

if [ $INSTALL_FIRACODE_FONT -eq 1 ]; then
    installFiracodeFont
fi

if [ $INSTALL_GO -eq 1 ]; then
   installGoProgrammingLanguage
fi

if [ $INSTALL_WEB_DEV_STUFF -eq 1 ]; then
   installWebDevStuff
fi

if [ $DEV_HELPER_TOOLS -eq 1 ]; then
    installProgrammingHelperTools
fi

if [ $JAVA -eq 1 ]; then
   installJava
fi

if [ $RUST -eq 1 ]; then
    installRust
fi

if [ $RUBY -eq 1 ]; then
    installRuby
fi

if [ $THUNAR -eq 1 ]; then
    installThunar
fi

if [ $FIREFOX -eq 1 ]; then
    installFirefox
fi

if [ $TRANSMISSION -eq 1 ]; then
    installTransmission
fi

if [ $RANGER -eq 1 ]; then
    installRanger
fi

if [ $DOCKER -eq 1 ]; then
    installDocker
fi

if [ $ENABLE_BLUETOOTH -eq 1 ]; then
    enableBluetooth
fi

if [ $USE_ALSA -eq 1 ]; then
    setupAlsa
fi

if [ $USE_PULSEAUDIO -eq 1 ]; then
    setupPulseaudio
fi

if [ $USE_PIPEWIRE -eq 1 ]; then
    setupPipewire
fi

if [ $INSTALL_XDG_STUFF -eq 1 ]; then
    installXdgRelatedStuff
fi

if [ $VIDEO_ACCELERATION -eq 1 ]; then
    enableVideoAcceleration
fi

if [ $INSTALL_PROPRIETARY_NVIDIA_DRIVER -eq 1 ]; then
    installProprietaryNvidiaDrivers
fi

if [ $SETUP_NIX_PACKAGE_MANAGER -eq 1 ]; then
    enableNixPackageManager
fi

if [ $LIBREWOLF -eq 1 ]; then
    installLibrewolf
fi

if [ $LOGSEQ -eq 1 ]; then
    installLogseq
fi

if [ $KVM -eq 1 ]; then
    setupKVM
fi

if [ $ENABLE_AUTOMOUNTING_DISKS -eq 1 ]; then
    enableAutoMountingDisks
fi

if [ $ENABLE_HOTKEY_DAEMON -eq 1 ]; then
    enableHotKeyDaemon
fi

if [ $ENABLE_REDSHIFT -eq 1 ]; then
    enableRedshift
fi

if [ $ENABLE_TAP_TO_CLICK -eq 1 ]; then
    enableTapToClick
fi

if [ $ENABLE_SSH -ne 1 ]; then
    disableSSH
fi

if [ $ENABLE_PSD -eq 1 ]; then
    enablePSD
fi

removeXbpsCache

# Login manager setups should execute last
if [ $EMPTTY -eq 1 ]; then
    installEmpttyLoginManager
fi

sudo reboot
