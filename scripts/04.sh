#!/bin/bash

if [ ! -f ~/cron_check ]; then
	md5sum /etc/crontab > ~/cron_check
fi

OLDSUM=$(cat ~/cron_check)
NEWSUM=$(md5sum /etc/crontab)

if [ "$OLDSUM" != "$NEWSUM" ]; then
	echo "/etc/crontab has been modified" | mail -s "Crontab update" root
	echo "$NEWSUM" > ~/cron_check
fi

#add to crontab -e
#echo '0 0 * * * root sh ~/cron_updatecheck_script' | crontab
