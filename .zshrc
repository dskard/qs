# setup colors for ls command
export CLICOLOR=1
export LSCOLORS=ExGxBxDxCxEgEdxbxgxcxd
alias ll="ls -alG"

# export PS1='%n@%m %/ $ '
autoload -U colors && colors
PS1="%B%F{034}%n@%m%f%b:%B%F{019}%~ %#%f%b "

# setup nvm
export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm
