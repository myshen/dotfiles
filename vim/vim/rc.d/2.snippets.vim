
" set grepprg=ag\ --vimgrep\ $*
" set grepformat=%f:%l:%c:%m

" Quickly select text you just pasted:
noremap gV `[v`]

vmap v <Plug>(expand_region_expand)
vmap <C-v> <Plug>(expand_region_shrink)

" join jump
" http://blog.sanctum.geek.nz/vim-annoyances/
nnoremap J mzJ`z
" " center screen on jump
" nnoremap n nzz
" nnoremap } }zz

" http://vim.wikia.com/wiki/Fix_syntax_highlighting
syntax enable sync minlines=2048
noremap <F12> <Esc>:syntax sync fromstart<CR>
inoremap <F12> <C-o>:syntax sync fromstart<CR>
runtime macros/matchit.vim

" tagbar
map <Leader>T :TagbarToggle<CR>

" " NERDTree
" map <Leader>e :NERDTreeToggle<CR>
" map <Leader>E :NERDTreeFind<CR>
" " https://github.com/ketan/vimrc/blob/master/vimrc.nerdtree
" let NERDTreeIgnore=[ '\.pyc$', '\.pyo$', '\.py\$class$', '\.obj$', '\.o$', '\.so$', '\.egg$', '^\.git$', '\.gem$',  '\.rbc$', '\~$']
" " netrw split explorer http://vimcasts.org/blog/2013/01/oil-and-vinegar-split-windows-and-project-drawer/
" " Alternatively, use https://github.com/tpope/vim-vinegar
" let NERDTreeHijackNetrw=1
" let NERDTreeShowFiles=1           " Show hidden files, too
" let NERDTreeShowHidden=1
" let NERDTreeQuitOnOpen=1          " Quit on opening files from the tree
" let NERDTreeHighlightCursorline=1 " Highlight the selected entry in the tree

" obsoleted by tpope/vim-eunuch
" use :SudoWrite()
" cmap w!! w !sudo tee % >/dev/null
" cmap w!! %!sudo tee > /dev/null %

" use :Mkdir()
" " https://github.com/bpierre/dotfiles/blob/master/vimrc
" " create the directories to the current file
" function! CreateDirectoriesToFile()
"   let curdir = expand('%:p:h')
"   call system('mkdir -p "'.curdir.'"')
"   echo 'created '.curdir
" endfunction

" if has('autocmd')
" else
"     set tabstop=4
"     set softtabstop=4
"     set shiftwidth=4
" endif

" " Sparkup no conflict with autocomplete
" let g:sparkupNextMapping = '<c-x>'

" Cursor line in active window
" nnoremap <Leader>CC :set cursorline! cursorcolumn!<CR>
" autocmd WinLeave * set nocursorline
" autocmd WinEnter * set cursorline
" set cursorline

" Color column for line length warning
if exists('+colorcolumn')
    set colorcolumn=120
    highlight colorcolumn ctermbg=235
else
    highlight LongLine ctermbg=darkred
    au BufWinEnter * let w:m2=matchadd('LongLine', '\%>120v.\+', -1)
endif

" Copy current line w/o indent
nnoremap vv ^vg_

" corrections
iab consloe console
iab lgo log

highlight Search ctermbg=blue ctermfg=black

"-------------------------------------------------------------------------------
" Folding
"-------------------------------------------------------------------------------
" set foldmethod=marker
set foldmethod=indent
" Don't autofold too much
set foldlevel=7

" http://dhruvasagar.com/2013/03/28/vim-better-foldtext
function! NeatFoldText()
  let line = ' ' . substitute(getline(v:foldstart), '^\s*"\?\s*\|\s*"\?\s*{{{\d*\s*', '', 'g') . ' '
  let lines_count = v:foldend - v:foldstart + 1
  let lines_count_text = '| ' . printf("%10s", lines_count . ' lines') . ' |'
  let foldcharstart = match(&fillchars, 'fold:\zs')
  let foldchar = strpart(&fillchars, foldcharstart, match(&fillchars, 'fold:.*\zs[,$]')-foldcharstart)
  #let foldchar = '·'
  let foldtextstart = strpart('+' . repeat(foldchar, v:foldlevel*2) . line, 0, (winwidth(0)*2)/3)
  let foldtextend = lines_count_text . repeat(foldchar, 8)
  let length = strlen(substitute(foldtextstart . foldtextend, '.', 'x', 'g'))
  return foldtextstart . repeat(foldchar, winwidth(0)-length) . foldtextend
endfunction
set foldtext=NeatFoldText()

" " -------------------------------------------------------------------------------
" " Easier window switching
" " -------------------------------------------------------------------------------
" " http://sontek.net/blog/detail/turning-vim-into-a-modern-python-ide#window-splits
" map <c-j> <c-w>j
" map <c-k> <c-w>k
" map <c-l> <c-w>l
" map <c-h> <c-w>h

" " ShowMarks
" let g:showmarks_enable=0
" highlight SignColumn ctermbg=233
" highlight ShowMarksHLl ctermfg=9 ctermbg=17
" highlight ShowMarksHLu ctermfg=1 ctermbg=17
" highlight ShowMarksHLo ctermfg=33 ctermbg=17
" highlight ShowMarksHLm ctermfg=166 ctermbg=17

" TagList
" https://aufather.wordpress.com/2010/09/01/taglist-in-vim/
"let Tlist_Close_On_Select = 1 "close taglist window once we selected something
"let Tlist_Exit_OnlyWindow = 1 "if taglist window is the only window left, exit vim
"let Tlist_GainFocus_On_ToggleOpen = 1 "automatically switch to taglist window
"let Tlist_Highlight_Tag_On_BufEnter = 1 "highlight current tag in taglist window
"let Tlist_Use_Right_Window = 1 "display taglist window on the right
"let Tlist_Process_File_Always = 1 "even without taglist window, create tags file, required for displaying tag in statusline
"let Tlist_Display_Prototype = 1 "display full prototype instead of just function name
" nnoremap <F5> :TlistToggle<CR>
" nnoremap <F6> :TlistShowPrototype<CR>

" http://stackoverflow.com/a/1536094/533198
function! Wipeout()
  " list of *all* buffer numbers
  let l:buffers = range(1, bufnr('$'))

  " what tab page are we in?
  let l:currentTab = tabpagenr()
  try
    " go through all tab pages
    let l:tab = 0
    while l:tab < tabpagenr('$')
      let l:tab += 1

      " go through all windows
      let l:win = 0
      while l:win < winnr('$')
        let l:win += 1
        " whatever buffer is in this window in this tab, remove it from
        " l:buffers list
        let l:thisbuf = winbufnr(l:win)
        call remove(l:buffers, index(l:buffers, l:thisbuf))
      endwhile
    endwhile

    " if there are any buffers left, delete them
    if len(l:buffers)
      execute 'bwipeout' join(l:buffers)
    endif
  finally
    " go back to our original tab page
    execute 'tabnext' l:currentTab
  endtry
endfunction

" Skeleton files
" http://vim.runpaint.org/typing/using-templates/
autocmd! BufNewFile * silent! 0r ~/.vim/skel/tmpl.%:e

" function! RestoreSession()
"   " vim called without arguments
"   let restorefile='~/tmp/saved_session.vim'
"   if argc() == 0 && filereadable(restorefile)
"     execute 'source '.restorefile
"   end
" endfunction
" autocmd VimEnter * call RestoreSession()
" 
" " Restore sessions when entering vim without arguments
" " save global session
" nnoremap <Leader>S :mksession! ~/tmp/saved_session.vim<CR>
" " save and close all files and save global session
" nnoremap <Leader>qs :mksession! ~/tmp/saved_session.vim<CR>:wqa<CR>
" " close all files without saving and save global session
" nnoremap <Leader>www :mksession! ~/tmp/saved_session.vim<CR>:qa!<CR>

" " Unite
" nnoremap <leader>f :Unite file_rec/async<cr>
" nnoremap <leader>/ :Unite grep:.<cr>
" nnoremap <leader>y :Unite history/yanks<cr>
" nnoremap <leader>s :Unite -quick-match buffer<cr>

" command to clear the query
command! C let @/=""

" " Ultisnips
" " Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
" let g:UltiSnipsExpandTrigger="<tab>"
" let g:UltiSnipsJumpForwardTrigger="<c-b>"
" let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" " If you want :UltiSnipsEdit to split your window.
" let g:UltiSnipsEditSplit="vertical"

" nathanaelkane/vim-indent-guides
let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_auto_colors = 0
let g:indent_guides_guide_size = 0
let g:indent_guides_start_level = 1
highlight IndentGuidesOdd  ctermbg=234
highlight IndentGuidesEven ctermbg=235

" http://stackoverflow.com/a/25233145
function! HighlightWordUnderCursor()
    if getline(".")[col(".")-1] !~# '[[:punct:][:blank:]]'
        exec 'match' 'Search' '/\V\<'.expand('<cword>').'\>/'
    else
        match none
    endif
endfunction

let g:ctrlp_map = 'K'
" CtrlP https://github.com/jasoncodes/dotfiles/blob/master/vim/plugins/ctrlp.vim
" http://sheerun.net/2014/03/21/how-to-boost-your-vim-productivity/
" configures CtrlP to use git or silver searcher for autocompletion
let g:ctrlp_use_caching = 0
if executable('ag')
  set grepprg=ag\ --nogroup\ --nocolor
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
else
  let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files . -co --exclude-standard', 'find %s -type f']
  let g:ctrlp_prompt_mappings = { 'AcceptSelection("e")': ['<space>', '<cr>', '<2-LeftMouse>']}
endif

" swap buffers :b#
nmap <C-e> :e#<CR>

" Make a simple "search" text object.
" http://vim.wikia.com/wiki/Copy_or_change_search_hit
vnoremap <silent> s //e<C-r>=&selection=='exclusive'?'+1':''<CR><CR>
    \:<C-u>call histdel('search',-1)<Bar>let @/=histget('search',-1)<CR>gv
    omap s :normal vs<CR>

" Autojump to the last edited position when a file is reopened
au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") |
                     \ exe "normal g'\"" | endif

" let g:airline#extensions#tagbar#flags = 'f'
" let g:airline_section_c = '%{TagInStatusLine()}'
"set statusline=%<%f\ %h%m%r\ %1*%{TagInStatusLine()}%*%=%-14.(%l,%c%V%)\ %P

" call camelcasemotion#CreateMotionMappings('<leader>')
"
set rtp+=/usr/local/opt/fzf

function! SpaceOpNo()
  let old = @/

  s/ \([=+-]\) /\1/

  let @/ = old
endfunction
function! SpaceOp()
  let old = @/

  s/\([=+-]\)/ \1 /

  let @/ = old
endfunction
nnoremap <Leader>= :call SpaceOp()<CR>
nnoremap <Leader>== :call SpaceOpNo()<CR>

nnoremap <Leader>ft <Esc>:filetype detect<CR>

map <F5> :Dispatch sleep 1; pydbgp.py %<CR>:python debugger.run()<CR>
