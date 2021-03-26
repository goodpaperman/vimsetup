# vimsetup
setup vim for new environment in one click

Usage:

# fork & clone
```
#git clone git@github.com:goodpaperman/vimsetup.git
#cd vimsetup
#/bin/sh -f setupvim4cscope.sh
#/bin/sh -f setupvim4gtags.sh
```

# using vim with cscope only, fit for pure c project
```
/bin/sh -c "$(curl -fsSL https://raw.githubusercontent.com/goodpaperman/vimsetup/main/setupvim4cscope.sh)"
```

# using vim with gtags, fit for c/c++/java project
```
/bin/sh -c "$(curl -fsSL https://raw.githubusercontent.com/goodpaperman/vimsetup/main/setupvim4gtags.sh)"
```

# reference
* cscope_maps.vim comes form http://cscope.sourceforge.net/cscope_maps.vim, adding timeout for complex keys
* see details: http://cscope.sourceforge.net/cscope_vim_tutorial.html
* gtags.vim & gtags-cscope.vim coms from GNU Global install package
* see details: https://ftp.gnu.org/pub/gnu/global/
