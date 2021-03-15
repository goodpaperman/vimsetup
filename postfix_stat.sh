#! /bin/sh
# to see postfix and their file numbers sorted reversely..
# you can add 'useful' postfixs into csmake.sh manually

#./postfix.sh | awk '{ arr[$1]+=1; } END { for (k in arr) print k " :" arr[k] }'
./postfix.sh | awk '{ arr[$1]+=1; } END { for (k in arr) print arr[k] " :" k }' | sort -nr
 
