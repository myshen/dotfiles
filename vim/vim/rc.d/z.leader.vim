set ttimeout
set ttimeoutlen=100

" Thanks sheerun
let mapLeader = '\'
map <Space> <Leader>

" go to buffer
" https://www.reddit.com/r/vim/comments/44e1ig/slug/czporx7
nnoremap <Leader>b :ls<CR>:buffer<Space>

" reload config
map <Leader>vr :source ~/.vimrc<cr>
map <Leader>ve :e ~/.vimrc<cr>

" Save modified buffers and reload externally modified files
map <Leader>R :checktime<CR>:wall<CR>:redraw!<CR>

" Jump to col 80
nmap <silent> <Leader>80 <ESC>80\|
nmap <silent> <Leader>120 <ESC>120\|

" Find merge conflict markers
nmap <silent> <Leader>cf <ESC>/\v^[<=>]{7}( .*\|$)<CR>

" toggle display of whitespace
nmap <Leader>l :set list!<CR>
nmap <Leader>w :set wrap!<CR>

" nmap <Leader>t :set expandtab tabstop=4 shiftwidth=4 softtabstop=4<CR>
" nmap <Leader>T :set expandtab tabstop=8 shiftwidth=8 softtabstop=4<CR>
" nmap <Leader>M :set noexpandtab tabstop=8 softtabstop=4 shiftwidth=4<CR>
" nmap <Leader>m :set expandtab tabstop=2 shiftwidth=2 softtabstop=2<CR>

nmap <Leader>w :setlocal wrap!<CR>:setlocal wrap?<CR>

" trim blank lines
nmap <Leader>W mz:%s/^\s*$//<CR>`z:let @/=""<CR>
" TODO whitespace

" highlight the current word
" nnoremap <silent> <Leader>hl :execute 'match W1 /\<<c-r><c-w>\>/'<cr> hi W1 guibg=#aeee00 guifg=#000000 ctermbg=154 ctermfg=16
nnoremap <silent> <Leader>hl :call HighlightWordUnderCursor()<CR>

" open file under cursor
" http://superuser.com/a/277326
map <Leader>gf :e <cfile><cr>

nnoremap <Leader>bn :bnext<cr>
nnoremap <Leader>bp :bprev<cr>
nnoremap <Leader>n :next<cr>
nnoremap <Leader>p :prev<cr>
nnoremap <Leader>/ :AgFromSearch<cr>

"-------------------------------------------------------------------------------
" Plugin specific
"-------------------------------------------------------------------------------

" fugitive maps
map <Leader>Gl :Gblame<Cr>
map <Leader>Gb :Gbrowse!<Cr>

nnoremap <Leader>gdh :Gdiff HEAD<cr>
nnoremap <Leader>gdhh :Gdiff HEAD^<cr>
nnoremap <Leader>gd^ :Gdiff HEAD^<cr>
nnoremap <Leader>gd :Gdiff 
