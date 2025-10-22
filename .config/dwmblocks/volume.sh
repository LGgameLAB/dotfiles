if pamixer --get-mute | grep -q true; then
    echo "🔇 muted"
else
    vol=$(pamixer --get-volume)
    if [ "$vol" -lt 20 ]; then
        icon="🔈"
    elif [ "$vol" -lt 60 ]; then
        icon="🔉"
    else
        icon="🔊"
    fi
    echo "$icon $vol%"
fi


