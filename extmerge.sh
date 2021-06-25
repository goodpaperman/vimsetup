#! /bin/sh
if [ $# -ne 4 ]; then
    # beyond compare has different parameter order as p4merge / kdiff3 
    echo Usage: extmerge.sh local-file base-file remote-file merged-file
fi

for i in $*
do
    echo "$i"
done

# pass them all to the beyond compare
"/Applications/Beyond Compare.app/Contents/MacOS/bcomp" $*
# ensure exit code is accepted by git
exit 0
