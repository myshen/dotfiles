" This must be first; it changes other options as side effects
set nocompatible
" Must turn off filetype before bundling setup
filetype off

if has('vim_starting')
  set runtimepath+=~/.vim/bundle/neobundle.vim/
endif
call neobundle#rc(expand('~/.vim/bundle/'))

" let NeoBundle manage NeoBundle
" required! 
NeoBundleFetch 'Shougo/neobundle.vim'

" NeoBundle 'altercation/vim-colors-solarized'
NeoBundle 'chriskempson/base16-vim'
NeoBundle 'vim-scripts/taglist.vim'

NeoBundle 'ConradIrwin/vim-bracketed-paste'

NeoBundle 'mileszs/ack.vim'

" NeoBundle 'panozzaj/vim-autocorrect'

NeoBundle 'scrooloose/nerdtree'
"
NeoBundle 'tpope/vim-fugitive'
"NeoBundle 'airblade/vim-gitgutter'
"
"NeoBundle 'thenoseman/vim-matchit'
NeoBundle 'tpope/vim-surround'

NeoBundle 'SirVer/ultisnips'
NeoBundle 'honza/vim-snippets'

"NeoBundle 'vim-scripts/ini-syntax-definition'
"NeoBundle 'vim-scripts/Pydiction'
"NeoBundle 'hynek/vim-python-pep8-indent'

"NeoBundle 'bingaman/vim-sparkup'

NeoBundle 'nathanaelkane/vim-indent-guides'

"NeoBundle 'tpope/vim-ragtag'
NeoBundle 'zakj/vim-showmarks'
"NeoBundle 'tpope/vim-rake'
NeoBundle 'vim-ruby/vim-ruby'
"NeoBundle 'scrooloose/syntastic'
NeoBundle 'tpope/vim-characterize'
NeoBundle 'othree/xml.vim'
"NeoBundle 'FredKSchott/CoVim'
"NeoBundle 'Shougo/unite.vim'
"NeoBundle 'christoomey/vim-tmux-navigator'
NeoBundle 'mgedmin/pythonhelper.vim'

NeoBundle 'jiangmiao/auto-pairs'
NeoBundle 'Raimondi/delimitMate'

" Must happen after bundle setup
filetype plugin indent on

" Brief help
" :NeoBundleList          - list configured bundles
" :NeoBundleInstall(!)    - install(update) bundles
" :NeoBundleSearch(!) foo - search(or refresh cache first) for foo
" :NeoBundleClean(!)      - confirm(or auto-approve) removal of unused bundles

" Installation check
NeoBundleCheck

let mapleader = ","

" http://vim.wikia.com/wiki/Fix_syntax_highlighting
syntax enable sync minlines=256


" clean up syntax highlighting problems
noremap <F12> <Esc>:syntax sync fromstart<CR>
inoremap <F12> <C-o>:syntax sync fromstart<CR>

" color scheme
let base16colorspace=256  " Access colors present in 256 colorspace
colorscheme base16-tomorrow

" Terminal colors http://blog.infinitered.com/entries/show/6
set background=dark " Do this after colorscheme. It doesn't work before.

set number

set hlsearch
set incsearch
set ignorecase

set nowrap

set autoindent
set title
set mouse=a

" We're modern. Send more characters!
set ttyfast
" Don't redraw when playing macros
set lazyredraw

" Hide buffers instead of closing.
set hidden

" See :h listchars
set listchars=tab:>.,trail:.,extends:#,nbsp:.

set pastetoggle=<F2>

" NERDTree
map <Leader>n :NERDTreeToggle<CR>
map <Leader>N :NERDTreeFind<CR>
" https://github.com/ketan/vimrc/blob/master/vimrc.nerdtree
let NERDTreeIgnore=[ '\.pyc$', '\.pyo$', '\.py\$class$', '\.obj$', '\.o$', '\.so$', '\.egg$', '^\.git$', '\.gem$',  '\.rbc$', '\~$']
let NERDTreeShowFiles=1           " Show hidden files, too
let NERDTreeShowHidden=1
let NERDTreeQuitOnOpen=1          " Quit on opening files from the tree
let NERDTreeHighlightCursorline=1 " Highlight the selected entry in the tree

" Write a file with sudo priviledges
cmap w!! w !sudo tee % >/dev/null

" Map w to :w
map W :wq<CR>

set wildignore=*.o,*.obj,*.bak,*.exe,*.pyc
" nnoremap `'
" nnoremap '`
set history=50
runtime macros/matchit.vim
set wildmenu
set wildmode=longest,list
set smartcase

" Briefly jump to the matched close block
set showmatch
set matchtime=0

set ruler
set showcmd

" Keep more lines of context visible
set scrolloff=5
set sidescroll=1
set sidescrolloff=5

" xterm title
set title

" Make backspace delete intuitively
set backspace=indent,eol,start

set noerrorbells

set swapfile
set backupdir=~/tmp,/tmp
set dir=~/tmp,/tmp

if has("mouse")
    set mouse=a
endif

au BufRead,BufNewFile *.feature set filetype=feature
au! Syntax newlang source $VIM/syntax/feature.vim

" CSV files
autocmd BufNewFile,BufRead *.csv setf csv
" HTML files
autocmd BufNewFile,BufRead *.html.erb set filetype=eruby
" Jinja files
autocmd BufNewFile,BufRead *.j2,*.jinja,*.jinja2 set filetype=htmljinja
" json file
autocmd BufNewFile,BufRead *.json set filetype=json syntax=javascript
"  equalprg=json_reformat
" Nginx config
autocmd BufRead,BufNewFile nginx.conf set filetype=nginx

set expandtab

if has('autocmd')
else
    set tabstop=4
    set softtabstop=4
    set shiftwidth=4
endif

" Sparkup no conflict with autocomplete
let g:sparkupNextMapping = '<c-x>'

" Cursor line in active window
nnoremap <Leader>c :set cursorline! cursorcolumn!<CR>
autocmd WinLeave * set nocursorline
autocmd WinEnter * set cursorline
set cursorline

" sudo write
cmap w!! %!sudo tee > /dev/null %

" Color 80 column
if exists('+colorcolumn')
    set colorcolumn=80
    highlight colorcolumn ctermbg=235
else
    highlight LongLine ctermbg=darkred
    au BufWinEnter * let w:m2=matchadd('LongLine', '\%>80v.\+', -1)
endif

" Jump to col 80
nmap <silent> <leader>80 <ESC>80\|

" Find merge conflict markers
nmap <silent> <leader>cf <ESC>/\v^[<=>]{7}( .*\|$)<CR>

" Copy current line w/o indent
nnoremap vv ^vg_

iab consloe console
iab lgo log

" highlight the current word
nnoremap <silent> <leader>h1 :execute 'match W1 /\<<c-r><c-w>\>/'<cr> hi W1 guibg=#aeee00 guifg=#000000 ctermbg=154 ctermfg=16
"highlight Folded ctermfg=black

" Folding
set foldmethod=marker
" Don't autofold too much
set foldlevel=5
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


" I can type :help on my own, thanks.
noremap <F1> <nop>
" I can also type :ex and :man
noremap Q <nop>
noremap K <nop>

" retain selection in visual mode when indenting blocks
" vnoremap < <gv
" vnoremap > >gv

" Allow moving into blank space in virtual
set virtualedit=block

" Split in intuitive direction
set splitbelow
set splitright

" Easier window switching
" http://sontek.net/blog/detail/turning-vim-into-a-modern-python-ide#window-splits
map <c-j> <c-w>j
map <c-k> <c-w>k
map <c-l> <c-w>l
map <c-h> <c-w>h

" Don't skip lines when wrapped
nnoremap j gj
nnoremap k gk
nnoremap gj j
nnoremap gk k
" wrap on word instead of character
set linebreak

" ShowMarks
let g:showmarks_enable=0
highlight SignColumn ctermbg=233
highlight ShowMarksHLl ctermfg=9 ctermbg=17
highlight ShowMarksHLu ctermfg=1 ctermbg=17
highlight ShowMarksHLo ctermfg=33 ctermbg=17
highlight ShowMarksHLm ctermfg=166 ctermbg=17

" TagList
" https://aufather.wordpress.com/2010/09/01/taglist-in-vim/
let Tlist_Close_On_Select = 1 "close taglist window once we selected something
let Tlist_Exit_OnlyWindow = 1 "if taglist window is the only window left, exit vim
let Tlist_GainFocus_On_ToggleOpen = 1 "automatically switch to taglist window
let Tlist_Highlight_Tag_On_BufEnter = 1 "highlight current tag in taglist window
let Tlist_Use_Right_Window = 1 "display taglist window on the right
let Tlist_Process_File_Always = 1 "even without taglist window, create tags file, required for displaying tag in statusline
let Tlist_Display_Prototype = 1 "display full prototype instead of just function name

nnoremap <F5> :TlistToggle<CR>
nnoremap <F6> :TlistShowPrototype<CR>

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

" Restore sessions when entering vim without arguments
" save global session
nnoremap <leader>S :mksession! ~/tmp/saved_session.vim<CR>
" save and close all files and save global session
nnoremap <leader>qs :mksession! ~/tmp/saved_session.vim<CR>:wqa<CR>
" close all files without saving and save global session
nnoremap <leader>www :mksession! ~/tmp/saved_session.vim<CR>:qa!<CR>

function! RestoreSession()
  " vim called without arguments
  let restorefile='~/tmp/saved_session.vim'
  if argc() == 0 && filereadable(restorefile)
    execute 'source '.restorefile
  end
endfunction
autocmd VimEnter * call RestoreSession()

""" Unite

nnoremap <leader>f :Unite file_rec/async<cr>
nnoremap <leader>/ :Unite grep:.<cr>
nnoremap <leader>y :Unite history/yanks<cr>
nnoremap <leader>s :Unite -quick-match buffer<cr>

""" vim-tmux-navigator
"let g:tmux_navigator_no_mappings = 1
"
"nmap <silent> <c-y> :TmuxNavigateLeft<cr>
"nmap <silent> <c-u> :TmuxNavigateDown<cr>
"nmap <silent> <c-i> :TmuxNavigateUp<cr>
"nmap <silent> <c-o> :TmuxNavigateRight<cr>
"nmap <silent> <c-\> :TmuxNavigatePrevious<cr>

set statusline=%<%f\ %h%m%r\ %1*%{TagInStatusLine()}%*%=%-14.(%l,%c%V%)\ %P

" command to clear the query
command C let @/=""

" Indent guides
let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_auto_colors = 0
let g:indent_guides_guide_size = 0
let g:indent_guides_start_level = 1
highlight IndentGuidesOdd  ctermbg=18
highlight IndentGuidesEven ctermbg=19
