#!/bin/bash
xargs -a arch.txt sudo pacman -S --needed
paru -S --needed - < aur.txt

