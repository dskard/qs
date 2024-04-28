#!/bin/sh

set -x 

apt update
apt -y upgrade

# general utilities
#    network-manager-openvpn \
#    subversion \
#    unetbootin \
apt -y install \
    aspell \
    binutils \
    bsdmainutils \
    bzip2 \
    ca-certificates \
    chkrootkit \
    chromium-browser \
    coreutils \
    curl \
    dia \
    dict \
    dictd \
    dict-bouvier \
    dict-elements \
    dict-foldoc \
    dict-freedict-all \
    dict-gazetteer2k \
    dict-gcide \
    dict-jargon \
    dict-moby-thesaurus \
    dict-vera \
    dict-wn \
    diffutils \
    direnv \
    dos2unix \
    doxygen \
    file \
    findutils \
    ftp \
    gdebi \
    geany \
    geeqie \
    gimp \
    git \
    gitk \
    grep \
    gzip \
    hostname \
    htop \
    iamerican \
    imagemagick \
    info \
    indent \
    inkscape \
    ispell \
    kcachegrind \
    kruler \
    less \
    libreoffice \
    manpages \
    manpages-dev \
    manpages-posix \
    manpages-posix-dev \
    mencoder \
    mkisofs \
    mount \
    mpv \
    nmap \
    nscd \
    ntp \
    okular \
    patch \
    patchutils \
    readline-common \
    rkhunter \
    rsync \
    scrot \
    sed \
    sharutils \
    strace \
    sudo \
    tar \
    tcpflow \
    time \
    tkdiff \
    traceroute \
    unrar-free \
    unzip \
    valgrind \
    vim \
    vim-gtk3 \
    wget \
    xvnc4viewer \
    zip \

# programming languages, compilers, interpreters
# python and R are installed by hand
apt -y install \
    autoconf \
    autotools-dev \
    bash \
    bison \
    flex \
    g++ \
    gcc \
    gdb \
    gfortran \
    libav-tools \
    libpcre3-dev \
    perl \
    perl-doc \
    perl-modules \
    python \
    tcl \
    tcl-doc \
    tcl-tclreadline \
    tk \

# latex packages
apt -y install \
    pandoc \
    preview-latex-style \
    tex4ht \
    texlive \
    texlive-bibtex-extra \
    texlive-font-utils \
    texlive-fonts-extra \
    texlive-fonts-extra-doc \
    texlive-formats-extra \
    texlive-generic-extra \
    texlive-humanities \
    texlive-humanities-doc \
    texlive-latex-extra \
    texlive-latex-extra-doc \
    texlive-math-extra \
    texlive-pictures \
    texlive-pictures-doc \
    texlive-publishers \
    texlive-publishers-doc \
    texlive-science \
    texlive-science-doc \
    vim-latexsuite \

# install ufw firewall and openssh-server
apt -y install \
    ufw \
    openssh-server \
    xauth

apt -y install \
    apt-file \
    libreadline-dev \
    libxt-dev

apt-file update

# arduino compilers
aptitude -y install avrdude gcc-avr gdb-avr simulavr avr-libc


# docker-ce
bash installs/docker-ce-latest_install.sh

# docker-compose
bash installs/docker-compose-1.16.1_install.sh

# zoom
bash installs/zoom-latest_install.sh

# skype
bash installs/skype-latest_install.sh

# vagrant
#bash installs/vagrant-2.0.1_install.sh

# google-chrome-stable
#bash installs/googlechrome_install.sh

# installing ssl serts properly?
# https://stackoverflow.com/a/30154802
#aptitude install ca-certificates
#mkdir -p /etc/pki/tls/certs
#cp /etc/ssl/certs/ca-certificates.crt /etc/pki/tls/certs/ca-bundle.crt

