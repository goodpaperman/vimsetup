#! /bin/sh
if [ $# -ne 7 ]; then 
  echo Usage: extdiff.sh first-file second-file
fi

#for i in $*
#do
#    echo "$i"
#done

# parameter passed by git diff:
# path old-file old-hex old-mode new-file new-hex new-mode
# beyond compare only what $2 & $5
"/Applications/Beyond Compare.app/Contents/MacOS/bcomp" "$2" "$5"
# ensure exit code is accepted by git
exit 0
