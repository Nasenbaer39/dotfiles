#!/bin/bash
paths=$@

if [[ -z $paths ]]; then 
	echo "No paths were specified, usage: ./wofi-vscode path1 path2 etc.."
	exit 0
fi

# Check whether the machine has fd available
if [ -x "$(command -v fd)" ]; then
	selected_path=$(fd . $paths --min-depth 1 --max-depth 1 --type d | wofi -d)
else
	# defer to find if not
	selected_path=$(find $paths -mindepth 1 -maxdepth 1 -type d | wofi -d)
fi

# Check if a folder was selected (non-empty string)
if [ -n "$selected_path" ]; then
    # Open the folder in VSCode
    cd $selected_path
    git pull
    code .
fi

