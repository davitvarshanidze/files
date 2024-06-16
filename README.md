## cmds
    defaults write -g KeyRepeat -int 1
    defaults write -g ApplePressAndHoldEnabled -bool false
    /bin/launchctl setenv MTL_HUD_ENABLED 1
    defaults write NSGlobalDomain NSAutomaticWindowAnimationsEnabled -bool false
    defaults write NSGlobalDomain NSAppSleepDisabled -bool YES
    sudo tmutil disable
    sudo dscacheutil -flushcache; sudo killall -HUP mDNSResponder
    defaults write -g NSDisableAutomaticTermination -bool true
    sudo launchctl list | grep -v apple | awk '{print $3}' | xargs -I{} sudo launchctl remove {}
    defaults write com.apple.Safari IncludeInternalDebugMenu 1
    defaults write NSGlobalDomain NSWindowResizeTime -float 0.001
    sudo defaults write /Library/Preferences/com.apple.loginwindow GuestEnabled -bool false
    defaults write com.apple.Terminal AppleShowScrollBars -string WhenScrolling
    brew update && brew upgrade
    sudo trimforce enable

    diskutil verifyDisk diskX // check disk health
    top -o MEM // check system memory usage
    top -o CPU // monitor CPU usage
    nettop // monitor network usage
    system_profiler SPPowerDataType // monitor battery health
    sudo purge // clear system cache
    
## casks
    adoptopenjdk
    burp-suite
    eloston-chromium
    firefox
    flux
    kindle
    obs
    qbittorrent
    rectangle
    scroll-reverser
    sensiblesidebuttons
    spotify
    multipass
    visual-studio-code
    vlc
    wireshark
    xquartz
    zotero
    tree 
    slack
    zoom
    discord
    OneMenu

## leaves
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
    node
    openvpn
    postgresql
    rlwrap
    telnet
    tmux
    vim
    wget
