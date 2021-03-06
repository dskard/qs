#!/bin/sh

set -x 

apt-get -y install aptitude

aptitude update
aptitude -y upgrade

# general utilities
aptitude -y install \
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
    dos2unix \
    doxygen \
    exuberant-ctags \
    file \
    findutils \
    flashplugin-installer \
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
    network-manager-openvpn \
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
    subversion \
    sudo \
    tar \
    tcpflow \
    time \
    tkdiff \
    traceroute \
    unetbootin \
    unrar-free \
    unzip \
    valgrind \
    vim \
    wget \
    xvnc4viewer \
    zip \

# programming languages, compilers, interpreters
# Python is provided by Anaconda
# R is installed by hand
aptitude -y install \
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
    octave \
    perl \
    perl-doc \
    perl-modules \
    pidgin \
    python \
    tcl \
    tcl-doc \
    tcl-tclreadline \
    tk \

# latex packages
aptitude -y install \
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

# virtualbox packages
aptitude -y install \
    virtualbox \
    virtualbox-dkms \
    virtualbox-guest-dkms \
    virtualbox-guest-x11 \
    virtualbox-qt

# install ufw firewall and openssh-server
aptitude -y install \
    ufw \
    openssh-server \
    xauth

aptitude -y install \
    apt-file \
    libreadline-dev \
    libxt-dev \
    mesa-common-dev \
    libglu1-mesa-dev \
    netcdf-bin \

apt-file update

# arduino compilers
aptitude -y install avrdude gcc-avr gdb-avr simulavr avr-libc


# packages for building rappture
#bash installs/rappture-build-env-deps_install.sh

# docker-ce
bash installs/docker-ce-latest_install.sh

# docker-compose
bash installs/docker-compose-1.16.1_install.sh

# zoom
bash installs/zoom-latest_install.sh

# skype
bash installs/skype-latest_install.sh

# vagrant
bash installs/vagrant-2.0.1_install.sh

# google-chrome-stable
bash installs/googlechrome_install.sh

# packages for rstudio server
#aptitude install \
#    libboost1.55-dev \
#    uuid-dev \
#    ant \
#    openjdk-7-jdk


# installing ssl serts properly?
# https://stackoverflow.com/a/30154802
#aptitude install ca-certificates
#mkdir -p /etc/pki/tls/certs
#cp /etc/ssl/certs/ca-certificates.crt /etc/pki/tls/certs/ca-bundle.crt

