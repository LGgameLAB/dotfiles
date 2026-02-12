# cd ~/Pictures/Backgrounds
if [ -z "$1" ]; then
    echo "choosing random"
    xwallpaper --center "$(ls -d "$PWD/Pictures/Backgrounds"/* | shuf -n 1 )"
else
    xwallpaper --center "$(ls -d "$PWD/Pictures/Backgrounds"/* | grep -m 1 $1 )"
fi
