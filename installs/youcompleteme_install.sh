#!/usr/bin/env bash

# https://valloric.github.io/YouCompleteMe/
# requires libclang

# good to additionally have
#   nodejs
#   openjdk8-8-jre
#   rustc

aptitude -y install \
    build-essential \
    cmake \
    python-dev \
    python3-dev

cd ~/.vim/bundle/YouCompleteMe

#    --clang-completer  - c language support
#    --js-completer     - js language supprt, requires nodejs
#    --java-completer   - java language support, requires jdk8

./install.py \
    --clang-completer \
    --js-completer \
    --java-completer \

# or to compile with everything available, say:
# ./install.py --all
