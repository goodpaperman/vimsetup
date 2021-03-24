#! /bin/sh

mkdir vimsetup
cd vimsetup

curl -fsSL https://github.com/goodpaperman/vimsetup/blob/main/cscope_maps.vim
curl -fsSL https://github.com/goodpaperman/vimsetup/blob/main/vimex.vim
curl -fsSL https://github.com/goodpaperman/vimsetup/blob/main/vimrc
curl -fsSL https://github.com/goodpaperman/vimsetup/blob/main/vim4cscope
curl -fsSL https://github.com/goodpaperman/vimsetup/blob/main/postfix.sh
curl -fsSL https://github.com/goodpaperman/vimsetup/blob/main/postfix_stat.sh
curl -fsSL https://github.com/goodpaperman/vimsetup/blob/main/csmake.sh

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

brew install cscope
# cscope -Rbqk
#brew install ctags

echo "remember to export CSCOPE_ROOT=/path/to/project/root/dir/ in ~/.bash_profile !!"
