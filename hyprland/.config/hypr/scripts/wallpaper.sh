#!/bin/bash

directory=~/Pictures/backgrounds

if [ -d "$directory" ]; then
    random_background=$(ls $directory | shuf -n 1)

    hyprctl hyprpaper unload all
    hyprctl hyprpaper preload $directory/$random_background
    hyprctl hyprpaper wallpaper ",$directory/$random_background"
fi
