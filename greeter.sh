echo "Hello Luke!"
pr -m -t -w 150 <(fortune | cowsay ) <(cal --color=always ) <(remindme) | lolcat

# GREETING=$(echo "GREETINGS $USER" | gum style --align center --padding "1 5" --width=35 --border rounded --margin "0 1")
# CALENDER=$(cal --color=always | gum style --align center --padding "1 4" --width=35 --border rounded  --margin "0 1")
# REMINDER=$(remindme | gum style --align center --padding "1 8" --width=35 --border rounded --margin "0 1")
#
# COW=$(fortune | cowsay | gum style --padding "1 5" --border rounded )
#
# FETCH=$(neofetch --stdout| gum style --border rounded --margin "0 1")
#
# STACK1=$(gum join --align center --vertical "$GREETING" "$CALENDER" "$REMINDER" | lolcat)
# #STACK2=$(gum join --align center "$GREETING" "$CALENDER" "$REMINDER" | lolcat)
# STACK2=$(gum join  "$COW" | lolcat)
# gum join "$STACK1" "$STACK2" "$FETCH" | lolcat
