#!/bin/sh

xrdb ~/.Xresources

sxhkd &
exec  bspwm
