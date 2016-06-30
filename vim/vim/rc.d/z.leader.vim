set ttimeout
set ttimeoutlen=100

" reload config
map <Leader>vr :source ~/.vimrc<cr>
map <Leader>ve :vsplit ~/.vimrc<cr>

" Save modified buffers and reload externally modified files
map <Leader>r :checktime<CR>:wall<CR>:redraw!<CR>

" Jump to col 80
nmap <silent> <leader>80 <ESC>80\|

" Find merge conflict markers
nmap <silent> <leader>cf <ESC>/\v^[<=>]{7}( .*\|$)<CR>

" toggle display of whitespace
nmap <leader>l :set list!<CR>
nmap <leader>w :set wrap!<CR>

nmap <leader>t :set expandtab tabstop=4 shiftwidth=4 softtabstop=4<CR>
nmap <leader>T :set expandtab tabstop=8 shiftwidth=8 softtabstop=4<CR>
nmap <leader>M :set noexpandtab tabstop=8 softtabstop=4 shiftwidth=4<CR>
nmap <leader>m :set expandtab tabstop=2 shiftwidth=2 softtabstop=2<CR>

nmap <leader>w :setlocal wrap!<CR>:setlocal wrap?<CR>

" trim blank lines
nmap <leader>W mz:%s/^\s*$//<CR>`z:let @/=""<CR>
" TODO whitespace

" highlight the current word
nnoremap <silent> <leader>h1 :execute 'match W1 /\<<c-r><c-w>\>/'<cr> hi W1 guibg=#aeee00 guifg=#000000 ctermbg=154 ctermfg=16

" open file under cursor
" http://superuser.com/a/277326
map <leader>gf :e <cfile><cr>

nnoremap <leader>p :prev<cr>
nnoremap <leader>gdh :Gdiff HEAD<cr>
nnoremap <leader>gdhh :Gdiff HEAD^<cr>
nnoremap <leader>gd^ :Gdiff HEAD^<cr>
nnoremap <leader>gd :Gdiff 
nnoremap <leader>/ :AgFromSearch<cr>

" Restore sessions when entering vim without arguments
" save global session
nnoremap <Leader>S :mksession! ~/tmp/saved_session.vim<CR>
" save and close all files and save global session
nnoremap <Leader>qs :mksession! ~/tmp/saved_session.vim<CR>:wqa<CR>
" close all files without saving and save global session
nnoremap <Leader>www :mksession! ~/tmp/saved_session.vim<CR>:qa!<CR>

nnoremap <Leader>p :CtrlP<CR>
