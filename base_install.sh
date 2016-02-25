#!/bin/sh

aptitude update
aptitude upgrade

# general utilities
aptitude install \
    aspell \
    binutils \
    bsdmainutils \
    bzip2 \
    chkrootkit \
    chromium-browser \
    coreutils \
    curl \
    dia \
    dict \
    diffutils \
    dos2unix \
    doxygen \
    file \
    findutils \
    flashplugin-installer \
    ftp \
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
    libreoffice-presenter-console \
    manpages \
    mencoder \
    mkisofs \
    mount \
    mpv \
    network-manager-openvpn \
    nmap \
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
# Python and R are provided by Anaconda
aptitude install \
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
aptitude install \
    latex-beamer \
    preview-latex-style \
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
    texpower \
    texpower-manual \
    vim-latexsuite \


# virtualbox packages
aptitude install \
    virtualbox \
    virtualbox-dkms \
    virtualbox-guest-dkms \
    virtualbox-guest-x11 \
    virtualbox-qt


# packages for building rappture
aptitude install \
    cmake \
    libavcodec-dev \
    libavformat-dev \
    libavutil-dev \
    libdx4-dev \
    libexpat1-dev \
    libfreetype6-dev \
    libgl1-mesa-swx11-dev \
    libjpeg8-dev \
    libmysqlclient-dev \
    libpng12-dev \
    libreadline-dev \
    libssl-dev \
    libswscale-dev \
    libtiff4-dev \
    libx11-dev \
    libxext-dev \
    libxft-dev \
    libxpm-dev \
    libxrandr-dev \
    libxt-dev


# docker stuff
aptitude install \
    docker.io \
    vim-syntax-docker \


# skype
sudo dpkg --add-architecture i386
sudo add-apt-repository "deb http://archive.canonical.com/ $(lsb_release -sc) partner"
sudo apt-get update
sudo apt-get install skype
