#! /bin/sh

mkdir vimsetup
cd vimsetup

#curl -fsSL https://raw.githubusercontent.com/goodpaperman/vimsetup/main/cscope_maps.vim
#curl -fsSL https://raw.githubusercontent.com/goodpaperman/vimsetup/main/vimex.vim
#curl -fsSL https://raw.githubusercontent.com/goodpaperman/vimsetup/main/vimrc
#curl -fsSL https://raw.githubusercontent.com/goodpaperman/vimsetup/main/vim4cscope
##curl -fsSL https://raw.githubusercontent.com/goodpaperman/vimsetup/main/postfix.sh
##curl -fsSL https://raw.githubusercontent.com/goodpaperman/vimsetup/main/postfix_stat.sh
#curl -fsSL https://raw.githubusercontent.com/goodpaperman/vimsetup/main/csmake.sh

wget https://raw.githubusercontent.com/goodpaperman/vimsetup/main/cscope_maps.vim
wget https://raw.githubusercontent.com/goodpaperman/vimsetup/main/vimex.vim
wget https://raw.githubusercontent.com/goodpaperman/vimsetup/main/vimrc
wget https://raw.githubusercontent.com/goodpaperman/vimsetup/main/vim4cscope
wget https://raw.githubusercontent.com/goodpaperman/vimsetup/main/csmake.sh

mkdir -p ~/.vim/plugin/
if [ ! -f ~/.vim/plugin/cscope_maps.vim ]; then 
    mv ./cscope_maps.vim ~/.vim/plugin/
else
    echo "appending cscope key maps into vim"
    cat ./cscope_maps.vim >> ~/.vim/plugin/cscope_maps.vim
fi

if [ ! -f ~/.vim/plugin/vimex.vim ]; then 
    mv ./vimex.vim ~/.vim/plugin/
else
    echo "appending vimex key maps into vim"
    cat ./vimex.vim >> ~/.vim/plugin/vimex.vim
fi

# include us
echo "source ~/.vim4cscope" >> vimrc

if [ ! -f ~/.vimrc ]; then 
    mv ./vimrc ~/.vimrc
else
    echo "appending settings into vim"
    cat ./vimrc >> ~/.vimrc
fi

if [ ! -f ~/.vim4cscope ]; then 
    mv ./vim4cscope ~/.vim4cscope
else
    echo "cover settings into vim4cscope"
    cat ./vim4cscope >> ~/.vim4cscope
fi

type cscope > /dev/null
if [ $? -ne 0 ]; then 
    echo "cscope not exist, try installing..."
    type brew > /dev/null
    if [ $? -eq 0 ]; then 
        brew install cscope
    else 
        type apt > /dev/null
        if [ $? -eq 0 ]; then 
            apt install cscope
        else
            type yum > /dev/null
            if [ $? -eq 0 ]; then 
                yum install cscope
            fi 
        fi
    fi
fi

# cscope -Rbqk
#brew install ctags

echo "remember to export CSCOPE_ROOT=/path/to/project/root/dir/ in ~/.bash_profile !!"
