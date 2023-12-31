#!/bin/bash

## Files and cmd
FILE="$HOME/.cache/eww_launch.xyz"
EWW="$HOME/.local/bin/eww -c $HOME/.config/eww"

# Run eww daemon if not running already
if [[ ! `pidof eww` ]]; then
	${EWW} daemon
	sleep 1
fi

## Open widgets 
run_eww() {
	${EWW} open-many bar
}

## Launch or close widgets accordingly and launch again
if [[ ! -f "$FILE" ]]; then
	touch "$FILE"
	run_eww
else
	${EWW} close-all && killall eww
	rm "$FILE"
	$HOME/.config/eww/launch.sh
fi
