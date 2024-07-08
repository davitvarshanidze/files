## cmds
    defaults write -g KeyRepeat -int 1
    defaults write -g ApplePressAndHoldEnabled -bool false
    defaults write NSGlobalDomain NSAppSleepDisabled -bool YES

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
    obs
    qbittorrent
    rectangle
    multipass
    visual-studio-code
    vlc
    wireshark
    zotero
    slack
    zoom
    discord

## leaves
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
    node
    openvpn
    rlwrap
    telnet
    tmux
    vim
    wget
