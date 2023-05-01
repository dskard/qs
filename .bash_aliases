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

alias R="R --vanilla"

if [ -f ~/.bash_aliases_local ]; then
    . ~/.bash_aliases_local
fi
