#! /bin/sh

mkdir setuptmp
cd setuptmp

if [ ! -f ../m.sh ]; then 
    type wget >/dev/null 2>&1
    if [ $? -eq 0 ]; then 
        wget --no-check-certificate https://raw.githubusercontent.com/goodpaperman/vimsetup/main/m.sh
    else
        curl -sO https://raw.githubusercontent.com/goodpaperman/vimsetup/main/m.sh
    fi
else 
    cp ../m.sh ./
fi 

if [ ! -f ~/.bash_m ]; then 
    cp ./m.sh ~/.bash_m
else
    echo "has .bash_m, nothing to do"
fi

# include us
if [ -f ~/.bash_profile ]; then 
    echo "has bash_profile, just source the bash_m at the tail"
    echo "source ~/.bash_m" >> ~/.bash_profile
elif [ -f ~/.bashrc ]; then 
    echo "has bashrc, just source the bash_m at the tail"
    echo "source ~/.bash_m" >> ~/.bashrc
else 
    echo "no bash_profile or bashrc, create bashrc"
    echo "source ~/.bash_m" >> ~/.bashrc
fi

echo "setup done! now source ~/.bash_profile or ~/.bashrc to take effect"
