#!/bin/bash

handle_key_press() {
    case "$1" in
        '1')
            echo "Number 1 key pressed"
            echo -ne "\0\0\x1e\0\0\0\0\0" > /dev/hidg0 && echo -ne "\0\0\0\0\0\0\0\0" > /dev/hidg0
            ;;
        '2')
            echo "Number 2 key pressed"
            echo -ne "\0\0\x1f\0\0\0\0\0" > /dev/hidg0 && echo -ne "\0\0\0\0\0\0\0\0" > /dev/hidg0
            ;;
        '3')
            echo "Number 3 key pressed"
            echo -ne "\0\0\x20\0\0\0\0\0" > /dev/hidg0 && echo -ne "\0\0\0\0\0\0\0\0" > /dev/hidg0
            ;;
        '4')
            echo "Number 4 key pressed"
            echo -ne "\0\0\x21\0\0\0\0\0" > /dev/hidg0 && echo -ne "\0\0\0\0\0\0\0\0" > /dev/hidg0
            ;;
        '5')
            echo "Number 5 key pressed"
            echo -ne "\0\0\x22\0\0\0\0\0" > /dev/hidg0 && echo -ne "\0\0\0\0\0\0\0\0" > /dev/hidg0
            ;;
        '6')
            echo "Number 6 key pressed"
            echo -ne "\0\0\x23\0\0\0\0\0" > /dev/hidg0 && echo -ne "\0\0\0\0\0\0\0\0" > /dev/hidg0
            ;;
        '7')
            echo "Number 7 key pressed"
            echo -ne "\0\0\x24\0\0\0\0\0" > /dev/hidg0 && echo -ne "\0\0\0\0\0\0\0\0" > /dev/hidg0
            ;;
        '8')
            echo "Number 8 key pressed"
            echo -ne "\0\0\x25\0\0\0\0\0" > /dev/hidg0 && echo -ne "\0\0\0\0\0\0\0\0" > /dev/hidg0
            ;;
        '9')
            echo "Number 9 key pressed"
            echo -ne "\0\0\x26\0\0\0\0\0" > /dev/hidg0 && echo -ne "\0\0\0\0\0\0\0\0" > /dev/hidg0
            ;;
        '0')
            echo "Number 0 key pressed"
            echo -ne "\0\0\x27\0\0\0\0\0" > /dev/hidg0 && echo -ne "\0\0\0\0\0\0\0\0" > /dev/hidg0
            ;;
        'n')
            echo "n key pressed"
            echo -ne "\0\0\x28\0\0\0\0\0" > /dev/hidg0 && echo -ne "\0\0\0\0\0\0\0\0" > /dev/hidg0
            ;;
        'b')
            echo "b key pressed"
            echo -ne "\0\0\x29\0\0\0\0\0" > /dev/hidg0 && echo -ne "\0\0\0\0\0\0\0\0" > /dev/hidg0
            ;;
        $'\x1b[C')
            echo "Right Arrow key pressed"
            echo -ne "\0\0\x4f\0\0\0\0\0" > /dev/hidg0 && echo -ne "\0\0\0\0\0\0\0\0" > /dev/hidg0
            ;;
        $'\x1b[D')
            echo "Left Arrow key pressed"
            echo -ne "\0\0\x50\0\0\0\0\0" > /dev/hidg0 && echo -ne "\0\0\0\0\0\0\0\0" > /dev/hidg0
            ;;
        $'\x1b[B')
            echo "Down Arrow key pressed"
            echo -ne "\0\0\x51\0\0\0\0\0" > /dev/hidg0 && echo -ne "\0\0\0\0\0\0\0\0" > /dev/hidg0
            ;;
        $'\x1b[A')
            echo "Up Arrow key pressed"
            echo -ne "\0\0\x52\0\0\0\0\0" > /dev/hidg0 && echo -ne "\0\0\0\0\0\0\0\0" > /dev/hidg0
            ;;
        *)
            echo "Unknown key pressed: $1"
            ;;
    esac
}
while true; do
    read -n 1 -s key
    if [[ "$key" == $'\x1b' ]]; then
        read -n 2 -s rest
        key+="$rest"
    fi
    echo "Key code: $key"
    handle_key_press "$key"
done
