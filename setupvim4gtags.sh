#! /bin/sh

mkdir vimsetup
cd vimsetup

wget https://raw.githubusercontent.com/goodpaperman/vimsetup/main/vimex.vim
wget https://raw.githubusercontent.com/goodpaperman/vimsetup/main/vimrc
wget https://raw.githubusercontent.com/goodpaperman/vimsetup/main/vim4gtags

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

type global
if [ $? -ne 0 ]; then 
    echo "global not exist, try installing..."
    type brew
    if [ $? -eq 0 ]; then 
        brew install global
    else 
        type apt
        if [ $? -eq 0 ]; then 
            apt install global
        else
            type yum
            if [ $? -eq 0 ]; then 
                yum install global
            fi 
        fi
    fi
fi

# gtags 

echo "remember to do gtags under your project !!"
