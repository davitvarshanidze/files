abbr -a yr 'cal -y'
abbr -a c cargo
abbr -a e nvim
abbr -a m make
abbr -a o xdg-open
abbr -a g git
abbr -a gc 'git checkout'
abbr -a ga 'git add .'
abbr -a gt 'git commit -m "batman"'
abbr -a gp 'git push'
abbr -a vimdiff 'nvim -d'
abbr -a ct 'cargo t'
abbr -a amz 'env AWS_SECRET_ACCESS_KEY=(pass www/aws-secret-key | head -n1)'
abbr -a ais "aws ec2 describe-instances | jq '.Reservations[] | .Instances[] | {iid: .InstanceId, type: .InstanceType, key:.KeyName, state:.State.Name, host:.PublicDnsName}'"
abbr -a gah 'git stash; and git pull --rebase; and git stash pop'
abbr -a ks 'keybase chat send'
abbr -a kr 'keybase chat read'
abbr -a kl 'keybase chat list'
abbr -a pr 'gh pr create -t (git show -s --format=%s HEAD) -b (git show -s --format=%B HEAD | tail -n+3)'

# Fish git prompt
set __fish_git_prompt_showuntrackedfiles 'yes'
set __fish_git_prompt_showdirtystate 'yes'
set __fish_git_prompt_showstashstate ''
set __fish_git_prompt_showupstream 'none'
set -g fish_prompt_pwd_dir_length 3

# Set colors for prompts
set -g fish_color_normal white
set -g fish_color_command green
set -g fish_color_error red
set -g fish_color_status red

# colored man output
# from http://linuxtidbits.wordpress.com/2009/03/23/less-colors-for-man-pages/
setenv LESS_TERMCAP_mb \e'[01;31m'       # begin blinking
setenv LESS_TERMCAP_md \e'[01;38;5;74m'  # begin bold
setenv LESS_TERMCAP_me \e'[0m'           # end mode
setenv LESS_TERMCAP_se \e'[0m'           # end standout-mode
setenv LESS_TERMCAP_so \e'[38;5;246m'    # begin standout-mode - info box
setenv LESS_TERMCAP_ue \e'[0m'           # end underline
setenv LESS_TERMCAP_us \e'[04;38;5;146m' # begin underline

setenv FZF_DEFAULT_COMMAND 'fd --type file --follow'
setenv FZF_CTRL_T_COMMAND 'fd --type file --follow'
setenv FZF_DEFAULT_OPTS '--height 20%'

function fish_user_key_bindings
	bind \cz 'fg>/dev/null ^/dev/null'
	if functions -q fzf_key_bindings
		fzf_key_bindings
	end
end

function fish_prompt
    set_color brblack
    echo -n "["(date "+%H:%M")"] "
    
    set_color white
    echo -n (hostname)
    
    set_color brblack
    echo -n ':'
    set_color green
    echo -n (string replace --regex "^$HOME" "~" $PWD)
    
    set_color green
    printf '%s' (__fish_git_prompt)
    
    set_color white
    echo -n '$ '
    set_color normal
end

function fish_greeting
    # Clear the screen for a fresh start
    clear

    # Display a title or logo (optional)
    # echo -e "\e[1;35mCustomShell\e[0m"

    # OS information
    set os (uname -s)
    set kernel (uname -r)
    echo -e "\e[1;34mOS:\e[0m $os $kernel"

    # Uptime
    set uptime (uptime | awk -F', ' '{print $1}' | sed 's/.*up //')
    echo -e "\e[1;34mUptime:\e[0m $uptime"

    # Memory usage
    set mem_used (math (ps -caxm -orss= | awk '{ sum+=$1 } END { print sum }') / 1024)
    set mem_total (sysctl -n hw.memsize)
    set mem_total (math $mem_total / 1024 / 1024)
    echo -e "\e[1;34mMemory Usage:\e[0m $mem_used MB / $mem_total MB"

    # Disk usage
    set disk_used (df -h / | awk 'NR==2 {print $3}')
    set disk_total (df -h / | awk 'NR==2 {print $2}')
    echo -e "\e[1;34mDisk Usage:\e[0m $disk_used / $disk_total"

    # CPU information
    set cpu (sysctl -n machdep.cpu.brand_string)
    echo -e "\e[1;34mCPU:\e[0m $cpu"

    # Network information (IP Address)
    set ip_address (ipconfig getifaddr en0)
    if test -z "$ip_address"
        set ip_address (ipconfig getifaddr en1)
    end
    if test -z "$ip_address"
        set ip_address "No active network interface found"
    end
    echo -e "\e[1;34mLocal IP Address:\e[0m $ip_address"

    # Current shell version
    echo -e "\e[1;34mFish Shell Version:\e[0m $FISH_VERSION"
    
    # Current date and time
    set current_date (date +"%A, %B %d, %Y %H:%M:%S")
    echo -e "\e[1;34mDate & Time:\e[0m $current_date"

    # Separator line
    echo 
end
