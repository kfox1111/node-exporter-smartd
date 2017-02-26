#!/bin/bash

if [ "x$CRONSPEC" == "x" ]; then
  #Every 10 minutes
  CRONSPEC="*/10 * * * *"
fi

echo "$CRONSPEC root /usr/bin/smartmon.sh > /srv/txt_collector/smartmon.prom" > /etc/cron.d/smartmon
chmod +x /etc/cron.d/smartmon
/usr/bin/smartmon.sh > /srv/txt_collector/smartmon.prom
crond -n
