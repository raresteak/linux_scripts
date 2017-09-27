#!/bin/bash
## Make an unbound dns include file from http://winhelp2002.mvps.org/ compiled
## hosts file

wget http://winhelp2002.mvps.org/hosts.txt -O /tmp/hosts.txt || exit

rm -f /tmp/unbound_popup_blocker.conf
# status indicator array
status[0]="\x8/"
status[1]="\x8X"
idx=0
echo -n "Making file for unbound, stand by  "
# the work
for line in `sed -e "s/\^M//g" /tmp/hosts.txt | grep 0.0.0.0 | awk {'print $2'}`
do
    myline="$(echo "$line"|tr -d \n)"
    echo "local-data: \"$myline A 0.0.0.0\"" >> /tmp/unbound_popup_blocker.conf
    # ex output
    # local-data: "evilsite.com A 0.0.0.0"
    # status indicator block
    echo -n -e ${status[$idx]}
    let "idx++"
    if [ $idx -gt 2 ]
    then
      idx=0
    fi
    #
done
echo ""
echo "`wc -l /tmp/hosts.txt |awk {'print $1'}` lines processed"
echo "File /tmp/unbound_popup_blocker.conf created."
echo "Place file in /etc/unbound/local.d and restart unbound daemon"
