files="xprofile     .xprofile
       compton.conf .config/compton.conf"

# ---------------------------------------

dotfiledir=$(dirname "$0")

echo "$files" | while read file target
do
    ln -sf "$dotfiledir/$file" "$HOME/$target"
done
