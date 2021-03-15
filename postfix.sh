#! /bin/sh
# to see how many postfixs we have under current directory recursively..

for line in `find . -type f`
do 
  #echo $line
  echo ${line##*.}
done

