#! /bin/sh

mkdir vimsetup
cd vimsetup

wget https://raw.githubusercontent.com/goodpaperman/vimsetup/main/gtags.vim
#wget https://raw.githubusercontent.com/goodpaperman/vimsetup/main/gtags-cscope.vim
wget https://raw.githubusercontent.com/goodpaperman/vimsetup/main/vimex.vim
wget https://raw.githubusercontent.com/goodpaperman/vimsetup/main/vimrc
wget https://raw.githubusercontent.com/goodpaperman/vimsetup/main/vim4gtags

mkdir -p ~/.vim/plugin/
if [ ! -f ~/.vim/plugin/gtags.vim ]; then 
    mv ./gtags.vim ~/.vim/plugin/
else
    echo "appending gtags key maps into vim"
    cat ./gtags.vim >> ~/.vim/plugin/gtags.vim
fi

#if [ ! -f ~/.vim/plugin/gtags-cscope.vim ]; then 
#    mv ./gtags-cscope.vim ~/.vim/plugin/
#else
#    echo "appending gtags-cscope key maps into vim"
#    cat ./gtags-cscope.vim >> ~/.vim/plugin/gtags-cscope.vim
#fi

if [ ! -f ~/.vim/plugin/vimex.vim ]; then 
    mv ./vimex.vim ~/.vim/plugin/
else
    echo "appending vimex key maps into vim"
    cat ./vimex.vim >> ~/.vim/plugin/vimex.vim
fi

# include us
echo "source ~/.vim4gtags" >> vimrc

if [ ! -f ~/.vimrc ]; then 
    mv ./vimrc ~/.vimrc
else
    echo "appending settings into vim"
    cat ./vimrc >> ~/.vimrc
fi

if [ ! -f ~/.vim4gtags ]; then 
    mv ./vim4gtags ~/.vim4gtags
else
    echo "cover settings into vim4gtags"
    cat ./vim4gtags >> ~/.vim4gtags
fi

function version_le() { test "$(echo "$@" | tr " " "\n" | sort -V | head -n 1)" == "$1"; }

type global > /dev/null
if [ $? -ne 0 ]; then 
    echo "global not exist, try installing..."
    type brew > /dev/null
    if [ $? -eq 0 ]; then 
        brew install global
    else 
        type apt > /dev/null
        if [ $? -eq 0 ]; then 
            apt install global
        else
            type yum > /dev/null
            if [ $? -eq 0 ]; then 
                yum install global
            fi 
        fi
    fi
else
    # global - GNU GLOBAL 5.7.1
    ver=$(global --version | head -n 1)
    # 5.7.1
    ver=${ver##* }
    #if [ "$ver" < "6.6.5" ]; then 
    if version_le "$ver" "6.6.5"; then 
        echo "global version $ver is too low, 6.6.5 at least"
    fi 
fi

# gtags 

echo "remember to do gtags under your project !!"
