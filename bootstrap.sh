#!/bin/bash

FILES=("x11/xprofile          $HOME/.xprofile"
       "x11/xresources        $HOME/.config/Xresources"
       "gtk-2.0/gtkrc         $HOME/.config/gtk-2.0/gtkrc"
       "gtk-3.0/settings.ini  $HOME/.config/gtk-3.0/settings.ini"
       "compton.conf          $HOME/.config/compton.conf"
       "awesome/rc.lua        $HOME/.config/awesome/rc.lua"
       "nanorc                $HOME/.nanorc")

# ---------------------------------------

srcdir=$(dirname "$0")

for line in "${FILES[@]}"
do
    read source target <<< "$line"
    mkdir -p "$(dirname "$target")"
    ln -rsf "$srcdir/$source" "$target"
done
