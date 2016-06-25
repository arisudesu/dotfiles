files="x11/xprofile     .xprofile
       x11/xresources   .config/Xresources
       compton.conf     .config/compton.conf
       tint2rc          .config/tint2/tint2rc"

files="${files}
       openbox/menu.xml          .config/openbox/menu.xml
       openbox/menu.sh           .config/openbox/menu.sh
       openbox/menu-functions.sh .config/openbox/menu-functions.sh
       openbox/menu-randr.sh     .config/openbox/menu-randr.sh
       openbox/autostart         .config/openbox/autostart"

# ---------------------------------------

dotfiledir=$(dirname "$0")

echo "$files" | while read file target
do
    if [ ! -d $(dirname "$HOME/$target") ]; then
        mkdir -p $(dirname "$HOME/$target")
    fi
    ln -rsf "$dotfiledir/$file" "$HOME/$target"
done
