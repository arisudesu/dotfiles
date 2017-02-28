files="x11/xprofile     .xprofile
       x11/xresources   .config/Xresources
       compton.conf     .config/compton.conf
       awesome/rc.lua   .config/awesome/rc.lua"

# ---------------------------------------

dotfiledir=$(dirname "$0")

echo "$files" | while read file target
do
    if [ ! -d $(dirname "$HOME/$target") ]; then
        mkdir -p $(dirname "$HOME/$target")
    fi
    ln -rsf "$dotfiledir/$file" "$HOME/$target"
done
