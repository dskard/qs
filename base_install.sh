#!/bin/sh

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
    libboost1.55-dev \
    libreoffice \
    libreoffice-presenter-console \
    manpages \
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
aptitude -y install \
    virtualbox \
    virtualbox-dkms \
    virtualbox-guest-dkms \
    virtualbox-guest-x11 \
    virtualbox-qt


# packages for building rappture
#aptitude install \
#    cmake \
#    libavcodec-dev \
#    libavformat-dev \
#    libavutil-dev \
#    libdx4-dev \
#    libexpat1-dev \
#    libfreetype6-dev \
#    libgl1-mesa-swx11-dev \
#    libjpeg8-dev \
#    libmysqlclient-dev \
#    libpng12-dev \
#    libreadline-dev \
#    libssl-dev \
#    libswscale-dev \
#    libtiff4-dev \
#    libx11-dev \
#    libxext-dev \
#    libxft-dev \
#    libxpm-dev \
#    libxrandr-dev \
#    libxt-dev


# docker stuff
aptitude -y install \
    docker.io \
    vim-syntax-docker \


# skype (old)
#sudo dpkg --add-architecture i386
#sudo add-apt-repository "deb http://archive.canonical.com/ $(lsb_release -sc) partner"
#sudo apt-get update
#sudo apt-get install skype
#
# instructions:
# http://ubuntuhandbook.org/index.php/2017/03/install-skype-5-0-for-linux-ubuntu-16-04/
# download skype from here:
# https://www.skype.com/en/download-skype/skype-for-computer/

aptitude -y install apt-transport-https
curl https://repo.skype.com/data/SKYPE-GPG-KEY | apt-key add -
echo "deb [arch=amd64] https://repo.skype.com/deb stable main" | tee /etc/apt/sources.list.d/skype-stable.list
aptitude update
aptitude -y install skypeforlinux




# gdal mapping stuff
#aptitude install \
#    gdal-bin \
#    libgdal-dev \
#    libproj-dev \


# extra libraries for compiling R
# deb pkg               ->  R pkg
# mesa-common-dev       ->  rgl
# libglu1-mesa-dev      ->  rgl
# netcdf-bin            ->  ncdf4
# libcairo2-dev         ->  Cairo
# jags                  ->  rjags
# 
# missing packages:
# pbkrtest -> car
# graph, Rgraphviz -> MCMCpack
# MCMCpack -> miscF
# rjags -> R2jags
# car -> systemfit, plm
# rgdal -> gdalUtils
# miscF, R2jags -> agRee
# maps -> ggmap
# rgl -> mixOmics

aptitude -y install \
    apt-file \
    libreadline-dev \
    libxt-dev \
    mesa-common-dev \
    libglu1-mesa-dev \
    netcdf-bin \


# packages for rstudio server
#aptitude install \
#    libboost1.55-dev \
#    uuid-dev \
#    ant \
#    openjdk-7-jdk

# arduino compilers
aptitude -y install avrdude gcc-avr gdb-avr simulavr avr-libc


# installing ssl serts properly?
# https://stackoverflow.com/a/30154802
#aptitude install ca-certificates
#mkdir -p /etc/pki/tls/certs
#cp /etc/ssl/certs/ca-certificates.crt /etc/pki/tls/certs/ca-bundle.crt
