# In ~/.profile
echo "Would you like to start Xorg? (y/n): "
read start_xorg
if [[ "$start_xorg" == [Yy]* ]]; then
        startx &
	systemctl start dnscrypt_proxy
else
        echo "You can start Xorg later with 'startx'."
fi
