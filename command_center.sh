#!/usr/bin/env bash

clear

echo "Welcome to command center"
echo
cd ~
zsh ~/greeter.sh
cmd=$(gum choose "Open PDF" "Code" "Play Game" "List Programs" "Play Music" "Watch Movie" "Look at stocks", "Hi Carah")

case "$cmd" in
	"Open PDF")
		file=$(fd -e pdf | fzf )
		zathura "$file" &
        echo 1
		;;
    "Code")
        nvim;;
	"Play Game")
		file=$(fd -e nes | fzf )
		nestopia "$file" &
        echo 1;;
	"List Programs")
		cmdtwo=$(gum choose "From desktop" "From pacman")
		case "$cmdtwo" in
			"From desktop")
				grep -h '^Name=' /usr/share/applications/*.desktop ~/.local/share/applications/*.desktop 2>/dev/null \
				  | cut -d= -f2 \
				  | sort -u \
				  | column;;

			"From pacman")
				pacman -Q;;
		esac;;
	"Play Music")
		musikcube;;

	"Hi Carah")
		echo "hello super amazing awesome gurl"
		;;

esac
