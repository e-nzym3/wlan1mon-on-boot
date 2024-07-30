# wlan1mon-on-boot
Simple bash loop script to put wlan1 into monitor mode on boot.

# How to Configure
_Note: The script's `log_file` variable located on the first line of the script determines where the log for this script will be saved. You will need to adjust this to match your case._
<br><br>
It is best to place this script within the `/root` directory so it's only accessible to the root user. Make it executable via `sudo chmod +x /root/wlan1mon-on-boot.sh`. Then add the following line to the root crontab via `sudo crontab -e`:
```
@reboot /root/wlan1mon-on-boot.sh
```
The script should now execute on each boot cycle.
