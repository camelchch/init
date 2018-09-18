#!/bin/bash

if [ ! -f /var/log/update_script.log ]; then
	sudo touch /var/log/update_script.log
fi

sudo apt-get update -y >> /var/log/update_script.log
sudo apt-get upgrate -y >> /var/log/update_script.log

#then use command crontab -e type below input
#0 4 * * 1 root path-of-script
