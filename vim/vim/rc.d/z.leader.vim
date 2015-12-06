
" reload config
map <Leader>vr :source ~/.vimrc<cr>
map <Leader>ve :vsplit ~/.vimrc<cr>

" Jump to col 80
nmap <silent> <leader>80 <ESC>80\|

" Find merge conflict markers
nmap <silent> <leader>cf <ESC>/\v^[<=>]{7}( .*\|$)<CR>

" toggle display of whitespace
nmap <leader>l :set list!<CR>
nmap <leader>w :set wrap!<CR>

" trim trailing whitespace
nmap <leader>W mz:%s/^\s*$//<CR>`z:let @/=""<CR>

" highlight the current word
nnoremap <silent> <leader>h1 :execute 'match W1 /\<<c-r><c-w>\>/'<cr> hi W1 guibg=#aeee00 guifg=#000000 ctermbg=154 ctermfg=16

" open file under cursor
" http://superuser.com/a/277326
map <leader>gf :e <cfile><cr>

nnoremap <leader>p :prev<cr>
nnoremap <leader>gdh :Gdiff HEAD<cr>
nnoremap <leader>gd :Gdiff 
nnoremap <leader>/ :AgFromSearch<cr>
