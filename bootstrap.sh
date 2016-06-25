files="xprofile     .xprofile
       compton.conf .config/compton.conf"

# ---------------------------------------

dotfiledir=$(dirname "$0")

echo "$files" | while read file target
do
    if [ ! -d $(dirname "$HOME/$target") ]; then
        mkdir -p $(dirname "$HOME/$target")
    fi
    ln -rsf "$dotfiledir/$file" "$HOME/$target"
done
