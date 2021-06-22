#! /bin/sh

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

# using vimdiff as git diff
git config --global diff.tool vimdiff
git config --global difftool.prompt false
git config --global alias.d difftool
echo "vimdiff now is the default diff tool, typing 'git d' to enjoying it !!"
