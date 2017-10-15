set ttimeout
set ttimeoutlen=80

" Thanks sheerun
let g:mapLeader = '\'
nmap <Space> <localleader>

" go to buffer
" https://www.reddit.com/r/vim/comments/44e1ig/slug/czporx7
nnoremap <localleader>bl :ls<CR>:buffer<Space>
nnoremap <localleader>fzf :FZF<CR>
nnoremap <localleader>fz. :FZF %:p:h<CR>
nnoremap <localleader>fz :FZF 
" open file under cursor
" http://superuser.com/a/277326
nnoremap <localleader>gf :e <cfile><cr>

" reload config
nnoremap <localleader>vr :source $MYVIMRC<cr>
nnoremap <localleader>ve :vsplit $MYVIMRC<cr>
nnoremap <localleader>vs :source <c-r>%<cr>
nnoremap <localleader>vc :e ~/.dotfiles/vim/vim/after/plugin/y.corrections.vim<CR>
nnoremap <localleader>vft :e ~/.dotfiles/vim/vim/ftplugin<CR>
nnoremap <localleader>vf :FZF ~/.dotfiles/vim/vim<CR>

" Save modified buffers and reload externally modified files
nnoremap <localleader>R :checktime<CR>:wall<CR>:redraw!<CR>

" Jump to col 80
nnoremap <silent> <localleader>80 <ESC>80\|
nnoremap <silent> <localleader>120 <ESC>120\|

" Find merge conflict markers
nnoremap <silent> <localleader>cf <ESC>/\v^[<=>]{7}( .*\|$)<CR>

" toggles
nnoremap <localleader>dl :echo "Use [ol or ]ol"<CR>
nnoremap <localleader>dw :echo "Use [ow or ]ow"<CR>
nnoremap <localleader>dn :echo "Use [on or ]on"<CR>

nnoremap <localleader>dq :call <SID>QuickfixToggle()<CR>
let g:quickfix_is_open = 0
function! s:QuickfixToggle()
  if g:quickfix_is_open
    cclose
    let g:quickfix_is_open = 0
    execute g:quickfix_return_to_window . "wincmd w"
  else
    let g:quickfix_return_to_window = winnr()
    copen
    let g:quickfix_is_open = 1
  endif
endfunction


" nmap <localleader>t :set expandtab tabstop=4 shiftwidth=4 softtabstop=4<CR>
" nmap <localleader>T :set expandtab tabstop=8 shiftwidth=8 softtabstop=4<CR>
" nmap <localleader>M :set noexpandtab tabstop=8 softtabstop=4 shiftwidth=4<CR>
" nmap <localleader>m :set expandtab tabstop=2 shiftwidth=2 softtabstop=2<CR>

" trim blank lines
nnoremap <localleader>W mz:%s/^\s*$//<CR>`z:let @/=""<CR>
" TODO whitespace

" highlight the current word
" nnoremap <silent> <localleader>hl :execute 'match W1 /\<<c-r><c-w>\>/'<cr> hi W1 guibg=#aeee00 guifg=#000000 ctermbg=154 ctermfg=16
nnoremap <silent> <localleader>hl :call HighlightWordUnderCursor()<CR>


nnoremap <localleader>cd :cd %:p:h<cr>
nnoremap <localleader>bn :bnext<cr>
nnoremap <localleader>bp :bprev<cr>
nnoremap <localleader>n :next<cr>
nnoremap <localleader>p :prev<cr>
" nnoremap <localleader>/ :AgFromSearch<cr>
"
nnoremap <localleader>diff :diffthis<cr>
nnoremap <localleader>diffup :diffupdate<cr>

"-------------------------------------------------------------------------------
" Plugin specific
"-------------------------------------------------------------------------------

" fugitive maps
nnoremap <localleader>Gl :Gblame<Cr>
nnoremap <localleader>Gb :Gbrowse!<Cr>

nnoremap <localleader>gdh :Gdiff HEAD<cr>
nnoremap <localleader>gdhh :Gdiff HEAD^<cr>
nnoremap <localleader>gd^ :Gdiff HEAD^<cr>
nnoremap <localleader>gd :Gdiff

"-------------------------------------------------------------------------------
" scratch space
"-------------------------------------------------------------------------------
