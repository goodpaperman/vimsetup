#! /bin/sh

mkdir setuptmp
cd setuptmp

if [ ! -f ../gtags.vim ]; then 
    type wget >/dev/null 2>&1
    if [ $? -eq 0 ]; then 
        wget https://raw.githubusercontent.com/goodpaperman/vimsetup/main/gtags.vim
    else
        curl -sO https://raw.githubusercontent.com/goodpaperman/vimsetup/main/gtags.vim
    fi
else 
    cp ../gtags.vim ./
fi 

#curl -sO https://raw.githubusercontent.com/goodpaperman/vimsetup/main/gtags-cscope.vim

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

if [ ! -f ../vim4gtags ]; then 
    type wget >/dev/null 2>&1
    if [ $? -eq 0 ]; then 
        wget https://raw.githubusercontent.com/goodpaperman/vimsetup/main/vim4gtags
    else
        curl -sO https://raw.githubusercontent.com/goodpaperman/vimsetup/main/vim4gtags
    fi
else
    cp ../vim4gtags ./
fi

mkdir -p ~/.vim/plugin/
if [ ! -f ~/.vim/plugin/gtags.vim ]; then 
    cp ./gtags.vim ~/.vim/plugin/
else
    echo "has gtags.vim, nothing to do"
fi

if [ ! -f ~/.vim/plugin/vimex.vim ]; then 
    cp ./vimex.vim ~/.vim/plugin/
else
    echo "has vimex.vim, nothing to do" 
fi

# include us
echo "source ~/.vim4gtags" >> vimrc

if [ ! -f ~/.vimrc ]; then 
    cp ./vimrc ~/.vimrc
else
    echo "has vimrc, just source the vim4gtags at the tail"
    #cat ./vimrc >> ~/.vimrc
    echo "source ~/.vim4gtags" >> ~/.vimrc
fi

if [ ! -f ~/.vim4gtags ]; then 
    cp ./vim4gtags ~/.vim4gtags
else
    echo "has vim4gtags, nothing to do"
fi

# dash choked on 
#   keyword: function -> null
#   string compare: == -> =
version_le() { str="$(echo $@ | tr ' ' '\n' | sort -V | head -n 1)"; test "$str" = "$1"; }

type global > /dev/null 2>&1
if [ $? -ne 0 ]; then 
    echo "global not exist, try installing..."
    type brew > /dev/null 2>&1
    if [ $? -eq 0 ]; then 
        brew install global
    else 
        type yum > /dev/null 2>&1
        if [ $? -eq 0 ]; then 
            yum install global
        else
            # centos has apt but not a package manager
            type apt > /dev/null 2>&1
            if [ $? -eq 0 ]; then 
                apt install global
            fi
        fi 
    fi
else
    dest="6.6.0"
    # global - GNU GLOBAL 5.7.1
    ver="$(global --version | head -n 1)"
    # 5.7.1
    ver=${ver##* }
    #if [ "$ver" < "$dest" ]; then 
    if ! version_le "$dest" "$ver"; then 
        echo "global version $ver is too low, $dest at least"
    fi 
fi

echo "remember to do gtags under your project !!"
