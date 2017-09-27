#!/bin/bash
# make some random dns entries for unbound
# place output in a <file>.conf
# mv to /etc/unbound/local.d

for i in {1..254}
do
    FIRST=`head /dev/urandom | tr -dc a-z | head -c 7 ; echo ''`
    LAST=`head /dev/urandom | tr -dc 0-9 | head -c 7 ; echo ''`
    echo "local-data: \"$FIRST-$LAST.lab IN A 10.10.10.$i\""
    echo "local-data-ptr: \"10.10.10.$i $FIRST-$LAST.local\""
    done

    #example
    #local-data: "ohwtthy-4110451.lab IN A 10.10.10.124"
    #local-data-ptr: "10.10.10.124 ohwtthy-4110451.local"

