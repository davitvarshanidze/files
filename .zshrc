export ZSH="$HOME/.oh-my-zsh"
plugins=(git)
source $ZSH/oh-my-zsh.sh
eval "$(/opt/homebrew/bin/brew shellenv)"
export CLICOLOR=1
export PS1=$'%n@%m:\e[0;36m%~\e[0m$ '
export EDITOR='vim'
