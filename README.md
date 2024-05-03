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
    defaults write com.apple.universalaccess reduceTransparency -bool true
    brew update && brew upgrade
    sudo trimforce enable

    diskutil verifyDisk diskX // check disk health
    top -o MEM // chcek system memory usage
    top -o CPU // monitor CPU usage
    sudo purge // clear system cache

## Karabiner commands:
    Simple Modifications: caps_lock => left_control
    Complex Modifications: Vi Style Arrows = Control + h/j/k/l to arrows
    
## Brew casks:
    automake
    binutils
    capstone
    coq
    elixir
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
    spotify
    vagrant
    virtualbox
    visual-studio-code
    vlc
    wireshark
    xquartz
    zotero
