# In ~/.profile
echo "Would you like to start Xorg? (y/n): "
read start_xorg
if [[ "$start_xorg" == [Yy]* ]]; then
	# systemctl enable --now udisks2
	# sudo udisksctl mount -b /dev/sda5
	startx &
	# systemctl start dnscrypt_proxy
else
        echo "You can start Xorg later with 'startx'."
fi

