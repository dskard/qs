#!/bin/bash

# installs Vundle, the vim bundle package manager
# notes from http://blog.awk.ninja/2015/08/rust-syntax-highlighting-in-vim.html

# show commands being run
set -x

# Fail script on error.
set -e

# install vundle
git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim

# make sure to add the following to your~/.vimrc:
#   set nocompatible
#   filetype off
#   set rtp+=~/.vim/bundle/Vundle.vim
#   call vundle#begin()
#   Plugin 'rust-lang/rust.vim'
#   call vundle#end()
#   filetype plugin indent on
#
# and then run the following command:
#   vim +PluginInstall +qall
#
