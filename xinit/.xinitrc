#!/bin/sh

# Load XTerm and source .Xresources
[ -f "$HOME"/.Xresources ] && xrdb -I "$HOME" -merge "$HOME"/.Xresources

# Start keybind daemon
sxhkd &

# Sessions - have to read up on this
session=${1:-bspwm}

# Case match of above?
case $session in
	bspwm	) exec bspwm		;;
	mate	) exec mate-session	;;
	xfce	) exec startxfce4	;;
	*) echo "Unknown session"	;;
esac
