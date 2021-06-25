#! /bin/bash
# only bash support echo -n, sh not

type git > /dev/null 2>&1
if [ $? -ne 0 ]; then 
    echo "global not exist, try installing..."
    type brew > /dev/null 2>&1
    if [ $? -eq 0 ]; then 
        brew install git
    else 
        type yum > /dev/null 2>&1
        if [ $? -eq 0 ]; then 
            yum install git
        else
            # centos has apt but not a package manager
            type apt > /dev/null 2>&1
            if [ $? -eq 0 ]; then 
                apt install git
            fi
        fi 
    fi
else
    echo "git installed"
fi

use_bc=0
echo -n "do you want to use BeyondCompare as you default diff/merge tool ? (n/y): "
read resp
case "$resp" in
  "y"|"Y"|"yes"|"YES"|"Yes")
    use_bc=1
    ;;
  *)
    ;;
esac

if [ $use_bc -eq 1 ]; then 
    # using beyond compare as git merge
    echo "copying file to /usr/local/bin need privilege..."
    sudo cp ./extmerge.sh /usr/local/bin/extmerge
    sudo chmod ugo+x /usr/local/bin/extmerge
    sudo cp ./extdiff.sh /usr/local/bin/extdiff
    sudo chmod ugo+x /usr/local/bin/extdiff
    git config --global diff.external extdiff
    git config --global merge.tool extmerge
    git config --global mergetool.extmerge.cmd "extmerge \"\$LOCAL\" \"\$BASE\" \"\$REMOTE\" \"\$MERGED\""
    git config --global mergetool.extmerge.trustExitCode false
    echo "beyond compare now is the default diff/merge tool, typing 'git diff/mergetool' to enjoying it !!"
else
    # using vimdiff as git diff
    git config --global diff.tool vimdiff
    git config --global difftool.prompt false
    git config --global alias.d difftool
    echo "vimdiff now is the default diff tool, typing 'git d' to enjoying it !!"
fi

