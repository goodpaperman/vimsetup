" copy from cscope_maps.vim
""""""""""""" key map timeouts
"
" By default Vim will only wait 1 second for each keystroke in a mapping.
" You may find that too short with the above typemaps.  If so, you should
" either turn off mapping timeouts via 'notimeout'.
"
set notimeout 
"
" Or, you can keep timeouts, by uncommenting the timeoutlen line below,
" with your own personal favorite value (in milliseconds):
"
set timeoutlen=4000
"
" Either way, since mapping timeout settings by default also set the
" timeouts for multicharacter 'keys codes' (like <F1>), you should also
" set ttimeout and ttimeoutlen: otherwise, you will experience strange
" delays as vim waits for a keystroke after you hit ESC (it will be
" waiting to see if the ESC is actually part of a key code like <F1>).
"
set ttimeout 
"
" personally, I find a tenth of a second to work well for key code
" timeouts. If you experience problems and have a slow terminal or network
" connection, set it higher.  If you don't set ttimeoutlen, the value for
" timeoutlent (default: 1000 = 1 second, which is sluggish) is used.
"
set ttimeoutlen=100
    
" resize split window size by w=/-/,/.
nmap    w=  :resize +3<CR>
nmap    w-  :resize -3<CR>
nmap    w.  :vertical resize -3<CR>
nmap    w,  :vertical resize +3<CR>

" scroll screen one line down/up using ctrl+j/k instead of ctrl+e/y
nmap    <C-j> <C-e>
nmap    <C-k> <C-y>

