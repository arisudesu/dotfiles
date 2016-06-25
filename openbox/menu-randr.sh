#!/bin/sh

DIRNAME=$(dirname "$0")
source "$DIRNAME/menu-functions.sh"

parse_xrandr_mode () {
    local output=$1
    local mode=$2
    local rate
    shift
    shift

    for rate in $(echo $* | tr -dc ' .[:alnum:]'); do
        item "$mode @ $rate" xrandr --output "$output" --mode "$mode" --rate $rate
    done
}

randr_menu () {
    local output=

    xrandr | while read -r line; do
        local argument=$(echo $line | cut -d ' ' -f 1)
        local state=$(echo $line | cut -d ' ' -f 2)

        if [ $state == "connected" ]; then
            output=$argument
            section "$argument"
        elif [ $state == "disconnected" ]; then
            output=
            section "$argument (off)"
        else
            [ "$output" != "" ] && parse_xrandr_mode $output $line
        fi
    done
}


pipe_begin

randr_menu

pipe_end
