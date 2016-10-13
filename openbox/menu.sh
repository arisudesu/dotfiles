#!/bin/sh

DIRNAME=$(dirname "$0")
source "$DIRNAME/menu-functions.sh"

TERMINAL="xterm -e"
EDITOR="${EDITOR:-geany}"

pipe_begin
    section "Applications"
    # item --icon "/usr/share/icons/hicolor/scalable/apps/blender.svg" "Blender" blender
    # item --icon "/usr/share/pixmaps/android-studio.png" "Android Studio" android-studio
    item --icon "/usr/share/pixmaps/pycharm.png" "PyCharm" pycharm
    item --icon "/usr/share/icons/hicolor/24x24/apps/QtProject-qtcreator.png" "Qt Creator" qtcreator

    separator
    item --icon "/usr/share/icons/hicolor/24x24/apps/firefox.png" "Firefox" firefox
    # item --icon "/usr/share/pixmaps/netsurf.xpm" "NetSurf" netsurf
    # item --icon "/usr/share/icons/hicolor/32x32/apps/psi.png" "Psi" psi
    item --icon "/usr/share/icons/hicolor/24x24/apps/qbittorrent.png" "qBittorrent" qbittorrent
    # item --icon "/usr/share/icons/hicolor/24x24/apps/qtox.png" "qTox" qtox
    # item --icon "/usr/share/pixmaps/skype.png" "Skype" skype
    # item --icon "/usr/share/pixmaps/telegram.png" "Telegram" telegram-desktop
    item --icon "/usr/share/icons/hicolor/32x32/apps/telegram-desktop.png" "Telegram" telegram-desktop
    item --icon "/usr/share/icons/hicolor/24x24/apps/thunderbird.png" "Thunderbird" thunderbird
    item --icon "/usr/share/pixmaps/vacuum.png" "Vacuum-IM" vacuum

    separator
    item "AlsaMixer" $TERMINAL alsamixer
    item "MOC" $TERMINAL mocp
    item "htop" $TERMINAL htop
    item --icon "/usr/share/pixmaps/mini.xterm_32x32.xpm" "xterm" xterm

    separator
    item --icon "/usr/share/icons/hicolor/48x48/apps/galculator.png" "galculator" galculator
    item --icon "/usr/share/icons/hicolor/scalable/apps/geany.svg" "Geany" geany
    # item --icon "/usr/share/icons/hicolor/48x48/apps/gpicview.png" "GPicView" gpicview
    
    # item --icon "/usr/share/pixmaps/lmms.png" "LMMS" lmms
    # item --icon "/usr/share/icons/hicolor/128x128/apps/lxterminal.png" "LXTerminal" lxterminal
    # item --icon "/usr/share/icons/Adwaita/24x24/apps/accessories-text-editor.png" "Mousepad" mousepad
    # item --icon "/usr/share/icons/hicolor/scalable/apps/onboard.svg" "Onboard" onboard
    item --icon "/usr/share/icons/Adwaita/24x24/apps/system-file-manager.png" "PCManFM" pcmanfm
    # item --icon "/usr/share/icons/hicolor/scalable/apps/xarchiver.svg" "XArchiver" xarchiver
    item --icon "/usr/share/icons/hicolor/scalable/mimetypes/virtualbox.svg" "VirtualBox" virtualbox
	item --icon "/usr/share/icons/hicolor/32x32/apps/vlc.png" "VLC Player" vlc

	section "Games"
	item "Minecraft" java -jar "Documents/TLauncher.jar"
	# item --icon "/usr/share/pixmaps/openttd.32.xpm" "OpenTTD" openttd
	# item --icon "/usr/share/pixmaps/steam.png" "Steam" steam
	
    # section "Places"
    # item "$HOME" pcmanfm "$HOME"
    # item "/mnt/storage" pcmanfm "/mnt/storage"
    
    section "Actions"
    menu "Screenshot"
        item "Screen"        scrot -d 3    -e \"mv \$f $(xdg-user-dir PICTURES)/\"
        item "Window"        scrot -d 3 -u -e \"mv \$f $(xdg-user-dir PICTURES)/\"
        item "Select region" scrot -s      -e \"mv \$f $(xdg-user-dir PICTURES)/\"
    end

    menu "Settings"
        item --icon "/usr/share/icons/hicolor/22x22/apps/nitrogen.png" "Nitrogen" nitrogen
        menu "Openbox"
            item "Edit autostart" $EDITOR "$DIRNAME/autostart"
            item "Edit env" $EDITOR "$DIRNAME/environment"
            item "Edit menu" $EDITOR "$0"
            item "obconf" obconf
            separator
            item "Reconfigure" openbox --reconfigure
            item "Restart" openbox --restart
            # item "Exit" openbox --exit
        end
        item --icon "/usr/share/icons/hicolor/scalable/apps/tint2conf.svg" "tint2conf" tint2conf

        pipemenu "xrandr" "$DIRNAME/menu-randr.sh"
    end


    menu "Session ($(whoami))"
		item "Lock screen" light-locker-command --lock
        item "Exit" openbox --exit
        separator
        item "Suspend" systemctl suspend
        item "Hybrid sleep" systemctl hybrid-sleep
        item "Hibernate" systemctl hibernate
        item "Reboot" systemctl reboot
        item "Shutdown" systemctl poweroff
    end
    
    BL=$(LANG=C printf "%.0f" $(xbacklight -get))
    
    menu "Backlight ($BL%)"
		for i in $(seq 100 -10 10); do
			item "$i%" xbacklight -set $i
		done
    end
pipe_end
