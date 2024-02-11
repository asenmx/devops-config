export ZSH="$HOME/.oh-my-zsh"
export USE_GKE_GCLOUD_AUTH_PLUGIN=True
export LANG=en_US.UTF-8

ZSH_THEME="agnoster"

setopt INC_APPEND_HISTORY
 HIST_STAMPS="mm/dd/yyyy"
plugins=(git fzf ssh-agent fasd colored-man-pages docker aws terraform pip golang ansible kubectl virtualenvwrapper)

source $ZSH/oh-my-zsh.sh

alias ssh="TERM=xterm ssh"
alias vim="nvim"
export SC_USER=1000:1000
alias rm='rm -I'

export SC_DOCKER_ENABLED=1
#. torsocks on

#Copy to clipboard function
function yy() {
    xclip -selection clipboard
}
