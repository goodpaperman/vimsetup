#! /bin/sh

mkdir setuptmp
cd setuptmp

# if we have wget, use it first, then try curl -fsSL
if [ ! -f ../cscope_maps.vim ]; then 
    type wget >/dev/null 2>&1
    if [ $? -eq 0 ]; then 
        wget https://raw.githubusercontent.com/goodpaperman/vimsetup/main/cscope_maps.vim
    else
        curl -sO https://raw.githubusercontent.com/goodpaperman/vimsetup/main/cscope_maps.vim
    fi
else
    cp ../cscope_maps.vim ./
fi 

if [ ! -f ../vimex.vim ]; then 
    type wget >/dev/null 2>&1
    if [ $? -eq 0 ]; then 
        wget https://raw.githubusercontent.com/goodpaperman/vimsetup/main/vimex.vim
    else
        curl -sO https://raw.githubusercontent.com/goodpaperman/vimsetup/main/vimex.vim
    fi
else
    cp ../vimex.vim ./
fi 

if [ ! -f ../vimrc ]; then 
    type wget >/dev/null 2>&1
    if [ $? -eq 0 ]; then 
        wget https://raw.githubusercontent.com/goodpaperman/vimsetup/main/vimrc
    else
        curl -sO https://raw.githubusercontent.com/goodpaperman/vimsetup/main/vimrc
    fi
else
    cp ../vimrc ./
fi

if [ ! -f ../vim4cscope ]; then 
    type wget >/dev/null 2>&1
    if [ $? -eq 0 ]; then 
        wget https://raw.githubusercontent.com/goodpaperman/vimsetup/main/vim4cscope
    else
        curl -sO https://raw.githubusercontent.com/goodpaperman/vimsetup/main/vim4cscope
    fi
else
    cp ../vim4cscope ./
fi

if [ ! -f ../csmake.sh ]; then 
    type wget >/dev/null 2>&1
    if [ $? -eq 0 ]; then 
        wget https://raw.githubusercontent.com/goodpaperman/vimsetup/main/csmake.sh
    else
        curl -sO https://raw.githubusercontent.com/goodpaperman/vimsetup/main/csmake.sh
    fi
else
    cp ../csmake.sh ./
fi

mkdir -p ~/.vim/plugin/
if [ ! -f ~/.vim/plugin/cscope_maps.vim ]; then 
    cp ./cscope_maps.vim ~/.vim/plugin/
else
    echo "has cscope_maps.vim, nothing to do"
fi

if [ ! -f ~/.vim/plugin/vimex.vim ]; then 
    cp ./vimex.vim ~/.vim/plugin/
else
    echo "has vimex.vim, nothing to do"
fi

# include us
echo "source ~/.vim4cscope" >> vimrc

if [ ! -f ~/.vimrc ]; then 
    cp ./vimrc ~/.vimrc
else
    echo "has vimrc, just source the vim4cscope at the tail"
    #cat ./vimrc >> ~/.vimrc
    echo "source ~/.vim4cscope" >> ~/.vimrc
fi

if [ ! -f ~/.vim4cscope ]; then 
    cp ./vim4cscope ~/.vim4cscope
else
    echo "has vim4cscope, nothing to do"
fi

type cscope > /dev/null 2>&1
if [ $? -ne 0 ]; then 
    echo "cscope not exist, try installing..."
    type brew > /dev/null 2>&1
    if [ $? -eq 0 ]; then 
        brew install cscope
    else 
        type yum > /dev/null 2>&1
        if [ $? -eq 0 ]; then 
            yum install cscope
        else
            # centos has apt but not a package manager
            type apt > /dev/null 2>&1
            if [ $? -eq 0 ]; then 
                apt install cscope
            fi
        fi 
    fi
fi

# cscope -Rbqk

echo "remember to export CSCOPE_ROOT=/path/to/project/root/dir/ in ~/.bash_profile, and do cscope -Rbqk at your project root !"
