## Terminal commands:
    defaults write -g KeyRepeat -int 1
    /bin/launchctl setenv MTL_HUD_ENABLED 1
    defaults write com.apple.dashboard mcx-disabled -boolean YES && killall Dock
    defaults write NSGlobalDomain NSAutomaticWindowAnimationsEnabled -bool false
    defaults write com.apple.dock expose-animation-duration -float 0.1 && killall Dock
    defaults write com.apple.finder DisableAllAnimations -bool true && killall Finder
    defaults write NSGlobalDomain NSAppSleepDisabled -bool YES
    sudo tmutil disable
    sudo dscacheutil -flushcache; sudo killall -HUP mDNSResponder
    defaults write com.apple.dock ResetLaunchPad -bool true && killall Dock
    defaults write -g NSDisableAutomaticTermination -bool true
    sudo launchctl list | grep -v apple | awk '{print $3}' | xargs -I{} sudo launchctl remove {}
    defaults write com.apple.Safari IncludeInternalDebugMenu 1
    defaults write NSGlobalDomain NSWindowResizeTime -float 0.001
    sudo defaults write /Library/Preferences/com.apple.loginwindow GuestEnabled -bool false
    brew update && brew upgrade
    sudo trimforce enable

    diskutil verifyDisk diskX // check disk health
    top -o MEM // chcek system memory usage
    top -o CPU // monitor CPU usage
    nettop // monitor network usage
    system_profiler SPPowerDataType // monitor battery health
    sudo purge // clear system cache

## Karabiner:
    Simple Modifications: caps_lock => left_control
    Complex Modifications: Vi Style Arrows = CMD + h/j/k/l to arrows
    
## Brew casks:
    automake
    binutils
    capstone
    exiftool
    gcc
    john-jumbo
    lean
    libtool
    md5sha1sum
    mit-scheme
    docker
    node
    openvpn
    postgresql
    rlwrap
    telnet
    ghidra
    tmux
    vim
    pyvim
    node
    lima
    python
    tree
    karabiner-elements
    slack
    zoom
    discord
    OneMenu
    wget
    adoptopenjdk
    burp-suite
    eloston-chromium
    firefox
    obs
    qbittorrent
    rectangle
    sensiblesidebuttons
    vagrant
    virtualbox
    visual-studio-code
    vlc
    wireshark
    xquartz
    zotero
