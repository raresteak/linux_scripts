#!/bin/bash
# Run script nightly from cron
# Create html from daily nmon file
# Rebuild index.html
cd /var/log/nmon || exit
/usr/local/bin/nmonchart `ls -tr *nmon | tail -1` /var/www/html/`ls -tr *nmon | tail -1`.html

cd /var/www/html
rm -f index.html
echo "<html>" >> index.html
echo "<title>Performance Statistics</title>" >> index.html
echo "<header>" >> index.html
echo "<h1>NMON Performance Statistics</h1></header>" >> index.html
echo "<p>" >> index.html
for i in $(ls -t *.nmon.html)
do
echo "<a href=/$i>$i</a>" >> index.html
echo "<br>" >> index.html
done
echo "</html>" >> index.html

# update root's crontab, add
#30 23 * * * find /var/log/nmon/*.nmon -mtime +180 -exec rm -fv {} \;
#0 0 * * * cd /var/log/nmon; /usr/local/bin/nmon -N -ft -s 60 -c 1430
#55 23 * * * /usr/local/bin/process_nmon.sh
