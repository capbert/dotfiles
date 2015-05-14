#! /bin/bash

DOTFILES=~/.dotfiles

linkables=$( ls -1 -d **/*.ln )

for link in $linkables ; do
    sourcename=$DOTFILES/$link
    linkname=$HOME/.$( basename $link .ln )
    echo "creating link $sourcename >> $linkname"
    ln -s $sourcename $linkname
done

