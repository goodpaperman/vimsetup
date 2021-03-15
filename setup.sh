#! /bin/sh
brew install cscope
# cscope -Rbqk
#brew install ctags

mkdir -p ~/.vim/plugin/
if [ ! -f ~/.vim/plugin/cscope_maps.vim ]; then 
    cp cscope_maps.vim ~/.vim/plugin/
else
    echo "appending key maps into vim"
    cat cscope_maps.vim >> ~/.vim/plugin/cscope_maps.vim
fi

if [ ! -f ~/.vimrc ]; then 
    cp vimrc ~/.vimrc
else
    echo "appending settings into vim"
    cat vimrc >> ~/.vimrc
fi

echo "remember to change /path/to/project/root/dir/ in ~/.vimrc !!"
