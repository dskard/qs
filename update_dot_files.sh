#! /bin/bash

dotfiles="\
    .bash_aliases \
    .curlrc \
    .tclshrc \
    .vimrc \
    .Xresources \
    .xscreensaver \
"

for f in $dotfiles; do 
    rm -f ~/${f}
    ln -s `pwd`/${f} ~/${f}
done

# copy the gitconfig because it needs to be modified manually.
cp .gitconfig ~/.gitconfig
