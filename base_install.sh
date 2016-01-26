#!/bin/sh

aptitude update
aptitude upgrade

aptitude install \
    aspell \
    autoconf \
    autotools-dev \
    bash \
    binutils \
    bison \
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
    flex \
    ftp \
    g++ \
    gcc \
    gdb \
    geany \
    geeqie \
    gfortran \
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
    latex-beamer \
    less \
    libav-tools \
    libpcre3-dev \
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
    octave \
    okular \
    patch \
    patchutils \
    perl \
    perl-doc \
    perl-modules \
    pidgin \
    python \
    python-imaging \
    python-matplotlib \
    python-pandas \
    python-pexpect \
    python-pycurl \
    python-tk \
    python-scientific \
    python-scipy \
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
    tcl \
    tcl-doc \
    texlive \
    time \
    tk \
    tkcvs \
    traceroute \
    unetbootin \
    unrar-free \
    unzip \
    valgrind \
    vim \
    vim-latexsuite \
    wget \
    xvnc4viewer \
    zip \

aptitude install \
    preview-latex-style \
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
    texpower-manual

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
