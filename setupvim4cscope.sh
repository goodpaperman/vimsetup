#! /bin/sh

mkdir setuptmp
cd setuptmp

#wget https://raw.githubusercontent.com/goodpaperman/vimsetup/main/cscope_maps.vim
#wget https://raw.githubusercontent.com/goodpaperman/vimsetup/main/vimex.vim
#wget https://raw.githubusercontent.com/goodpaperman/vimsetup/main/vimrc
#wget https://raw.githubusercontent.com/goodpaperman/vimsetup/main/vim4cscope
#wget https://raw.githubusercontent.com/goodpaperman/vimsetup/main/csmake.sh

# -fsSL
if [ ! -f ../cscope_maps.vim ]; then 
    curl -sO https://raw.githubusercontent.com/goodpaperman/vimsetup/main/cscope_maps.vim
else
    cp ../cscope_maps.vim ./
fi 

if [ ! -f ../vimex.vim ]; then 
    curl -sO https://raw.githubusercontent.com/goodpaperman/vimsetup/main/vimex.vim
else
    cop ../vimex.vim ./
fi 

if [ ! -f ../vimrc ]; then 
    curl -sO https://raw.githubusercontent.com/goodpaperman/vimsetup/main/vimrc
else
    cp ../vimrc ./
fi

if [ ! -f ../vim4cscope ]; then 
    curl -sO https://raw.githubusercontent.com/goodpaperman/vimsetup/main/vim4cscope
else
    cp ../vim4cscope ./
fi

if [ ! -f ../csmake.sh ]; then 
    curl -sO https://raw.githubusercontent.com/goodpaperman/vimsetup/main/csmake.sh
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
    echo "appending settings into vim"
    cat ./vimrc >> ~/.vimrc
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
