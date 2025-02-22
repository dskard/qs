function lookup { dict $* | less; }

function scrot_it { scrot -zbcd 5 -q 100 -s $*; }

function joinpdf {
    # joinpdf outputfile inputfiles
    gs -dBATCH -dNOPAUSE -q -sDEVICE=pdfwrite -sOutputFile=$*;
}

function shrink { convert -resize 1024x768 $1 $2; }

function vnckill { pkill -f "ssh -f -N -C -T -L"; }

function vncsec {
    # cheri small vnc window
    #   vncsec cheri 5903 5904
    # gada small vnc window
    #   vncsec gadabout.hubzero.org 5903 5905
    # large vnc window
    #   vncsec cheri 5901 5902
    ssh -f -N -C -T -L$3:localhost:$2 $1;
    # echo $!; # > ~/.vnc/$0.pid
    vncviewer localhost:$3;
}

function watchdmesg { watch -n 5 "dmesg | tail -30"; }

function watchsyslog { sudo watch -n 5 "tail -30 /var/log/syslog"; }

function watchconns { sudo watch -n 2 "netstat -ntp"; }

function watchnethogs { sudo nethogs wlp3s0; }

function sendkey {
    # sendkey dkearney@login.hubzero.org
    cat ~/.ssh/id_dsa.pub | ssh $1 'cat - >> ~/.ssh/authorized_keys'
}

function fluff {
    du -a . | sort -gr
}

function getkeycode {
    xev | sed -n 's/^.*keycode *\([0-9]\+\).*$/keycode \1 = /p'
}

function git-update-merge {
  git checkout master && git pull && git checkout - && git merge master
}

function git-update-rebase {
  git checkout master && git pull && git checkout - && git rebase master
}

function git-update-master {
  git checkout master && git pull origin master && git checkout -
}

function watch-docker-ps {
  watch -n 1 "docker ps --format \"table {{.Image}}\t{{.Names}}\t{{.Ports}}\""
}

function restart_alsa {
  pulseaudio -k
  sleep 2
  sudo alsa force-reload
}

function docker-cleanup {
  # remove stopped containers
  docker ps -aq --no-trunc -f status=exited | xargs docker rm

  # remove all unused or dangling images, containers, volumes, networks
  docker system prune

}

function docker-remove {
    # usage docker-remove "\-1.5.14.1053"
    docker rmi $(docker images | grep "$1" | awk '{print $3}') --force
}

function docker-search {
    # usage docker-search "\-1.5.14.1053"
    docker images | grep "$1"
}

export EDITOR=vim

# add TERMINFO so astral-sh and python from uv
# dont complain about:
#   Cannot read termcap database;
# https://github.com/astral-sh/rye/issues/250
export TERMINFO=/lib/terminfo

# add Pulumi to the PATH
export PATH=$PATH:$HOME/.pulumi/bin

# add binaries from Go projects to PATH
export PATH=$PATH:$HOME/go/bin

# enable keychain
# https://superuser.com/a/1808594
eval "$(keychain --eval --quiet)"

# setup pyenv
# eval "$(pyenv init --path)"
export PYENV_ROOT="$HOME/.pyenv"
[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
#command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

# setup pyenv-virtualenv
eval "$(pyenv virtualenv-init -)"

# disable pyenv from changing the prompt
# to show which virtualenv you are in
# use `pyenv versions | grep "*"` instead
export PYENV_VIRTUALENV_DISABLE_PROMPT=1

## setup renv-installer
## commented out, use rig instead, 20250208
#export RENV_ROOT="$HOME/.renv"
#command -v renv >/dev/null || export PATH="$RENV_ROOT/bin:$PATH"
#eval "$(renv init -)"

# setup direnv
eval "$(direnv hook bash)"

# setup nvm
#export NVM_DIR="$HOME/.nvm"
#[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
#[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# commented out 20250208, this was adding nvm to the path
# i think i prefer to add node to the path through direnv
# as shown below
#export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
#[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm

# setup nvm to work with direnv
# https://github.com/direnv/direnv/issues/335#issuecomment-921284934
# https://github.com/direnv/direnv/issues/335#issuecomment-937051564
# you probably still need a .nvmrc file in your directory with the version inside
# in your .envrc add `use node`
# or follow:
# https://github.com/direnv/direnv/issues/335#issuecomment-1330333436
#
# or without setting the version in .nvmrc, you can set .envrc to
# ```
# use node 8.9.4
# ```
# for details see:
# https://stackoverflow.com/a/62095070
# https://github.com/direnv/direnv/wiki/Node#load-nodejs-version-specified-in-envrc
export NODE_VERSION_PREFIX=v
NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
export NVM_DIR
export NODE_VERSIONS="${NVM_DIR}/versions/node"

# start the 1password daemon
op daemon --background --timeout 0

function opon {
    # OP_USER_UUID=$(op account list --format json | jq -r --arg account ${OP_ACCOUNT} '.[] | select(.url | contains($account)) .user_uuid')

    # check if we are signed in
    signed_in=$(op whoami &>/dev/null; echo $?)

    if [[ "${signed_in}" == "1" ]] ; then
        # we are not signed in, so sign in
        eval "$(op signin)"
        direnv reload
    fi
}

function opoff {
    # check if we are signed in.
    signed_in=$(op whoami &>/dev/null; echo $?)

    if [[ "${signed_in}" == "0" ]] ; then

        # we are signed in
        # figure out who we are signed in as.
        OP_USER_UUID=$(op whoami --format json | jq -r '.user_uuid')

        # signout
        op signout

        # unset the token
        unset "OP_SESSION_${OP_USER_UUID}"
    fi
}

# load other bash aliases
if [ -f ~/.bash_aliases_local ]; then
    . ~/.bash_aliases_local
fi

