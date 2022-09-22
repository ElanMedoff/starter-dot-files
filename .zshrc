export ZSH="/path/to/.oh-my-zsh"

# dedups path
PATH="$(perl -e 'print join(":", grep { not $seen{$_}++ } split(/:/, $ENV{PATH}))')"
export PATH

ZSH_THEME="elan"
COMPLETION_WAITING_DOTS="true"

# zsh-syntax-highlighting and zsh-autosuggestions need to be installed manually
plugins=(z sudo web-search copydir copyfile copybuffer zsh-syntax-highlighting zsh-autosuggestions)
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=#ff00ff"

source $ZSH/oh-my-zsh.sh

bindkey '^ ' autosuggest-execute

alias ga="git add"
alias gs="git status"
alias gam="git add -A && git commit -m"
alias gpush="git push origin HEAD"
alias e="exit"
alias c="clear"
alias ezsh="nvim ~/.zshrc"
alias evim="nvim ~/.config/nvim/init.vim"
alias etmux="nvim ~/.config/tmux/tmux.conf"
alias evim="nvim ~/.config/nvim"
alias cats="highlight -O ansi --force"
alias src="exec zsh"
alias tsrc="tmux source ~/.tmux.conf"
alias n="n.sh"

mkcd () { mkdir $1 && cd $1 }
cdl() { cd $1 && ls }
zl() { z $1 && ls }
search() {grep "$1" ~/.zsh_history | tail -n 20}
encrypt() {openssl des -in $1 -out $1.enc}
decrypt() {openssl des -d -in $1.enc -out $1}
gd() {
  nvim -p $(git diff --name-only) -c ":tabdo :Gvdiffsplit"
}
gamp() {
  gam $1 && gpush
}
