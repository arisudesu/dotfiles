#!/bin/sh

pipe_begin () {
    echo '<openbox_pipe_menu>'
}

pipe_end () {
    echo '</openbox_pipe_menu>'
}

menu () {
    echo '<menu id="'$1'" label="'$1'">'
}

end () {
    echo '</menu>'
}

item () {
    local icon=
    
    while [ $# -gt 0 ]; do
        case "$1" in
            --icon) shift; icon="$1";;
            --*) ;;
            *) break;;
        esac
        shift
    done

    local label="$1"
    shift
    local command="$*"

    echo -n '<item label="'$label'"'
    if [ -n "$icon" ]; then
        echo -n ' icon="'$icon'"'
    fi
    echo '>'
    if [ -n "$command" ]; then
        echo '<action name="Execute"><execute>'$command'</execute>'
        echo '</action>'
    fi
    echo '</item>'
}

separator () {
    echo '<separator/>'
}

section () {
    echo '<separator label="'$1'"/>'
}

pipemenu () {
    echo '<menu id="'$1'" label="'$1'" execute="'$2'"/>'
}
