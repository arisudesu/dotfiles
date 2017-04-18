#!/bin/bash

FILES=("x11/xprofile    $HOME/.xprofile"
       "x11/xresources  $HOME/.config/Xresources"
       "compton.conf    $HOME/.config/compton.conf"
       "awesome/rc.lua  $HOME/.config/awesome/rc.lua"
       "nanorc          $HOME/.nanorc")

# ---------------------------------------

srcdir=$(dirname "$0")

for line in "${FILES[@]}"
do
    read source target <<< "$line"
    mkdir -p "$(dirname "$target")"
    ln -rsf "$srcdir/$source" "$target"
done
