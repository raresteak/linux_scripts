#!/bin/sh
# D6 dice roller
# Written with Tunnels and Trolls game in mind but
# game that uses a number of D6's can use this script.

read -p "Enter number of D6 to roll: " DICE


TOTAL=0
TOTALSIX=0

echo "Rolling $DICE"
echo "Possible max of rolling $DICE is $(( $DICE * 6 ))"
while [ $DICE -ge 1 ]
do
	X=$(shuf -i 1-6 -n 1)

	if [ $X -eq 6 ]
        then
               SIX="*" 
	       TOTALSIX=$(( $TOTALSIX + 1 ))
        fi
	
	echo "Die#${DICE},${X} $SIX"
	unset SIX
	DICE=$(( $DICE - 1 ))
	TOTAL=$(( $TOTAL+$X ))

done
echo "Total: ${TOTAL} and $TOTALSIX natural 6's"
