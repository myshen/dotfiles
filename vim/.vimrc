" This must be first; it changes other options as side effects
set nocompatible
" Must turn off filetype before vundle setup
filetype off

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
" required! 
Bundle 'gmarik/vundle'

" Bundle 'mileszs/ack.vim'
" Bundle 'panozzaj/vim-autocorrect'
Bundle 'altercation/vim-colors-solarized'
Bundle 'vim-scripts/taglist.vim'
Bundle 'tpope/vim-fugitive'
Bundle 'airblade/vim-gitgutter'
Bundle 'thenoseman/vim-matchit'
Bundle 'tpope/vim-surround'
Bundle 'vim-scripts/ini-syntax-definition'
Bundle 'vim-scripts/Pydiction'
Bundle 'hynek/vim-python-pep8-indent'
Bundle 'bingaman/vim-sparkup'
Bundle 'nathanaelkane/vim-indent-guides'
Bundle 'tpope/vim-ragtag'
Bundle 'zakj/vim-showmarks'
Bundle 'tpope/vim-rake'
Bundle 'vim-ruby/vim-ruby'
Bundle 'scrooloose/nerdtree'

" Must happen after vundle setup
filetype plugin indent on

"
" Brief help
" :BundleList          - list configured bundles
" :BundleInstall(!)    - install(update) bundles
" :BundleSearch(!) foo - search(or refresh cache first) for foo
" :BundleClean(!)      - confirm(or auto-approve) removal of unused bundles
"
" see :h vundle for more details or wiki for FAQ
" NOTE: comments after Bundle command are not allowed..

let mapleader = ","

" http://vim.wikia.com/wiki/Fix_syntax_highlighting
syntax enable sync minlines=256

" clean up syntax highlighting problems
noremap <F12> <Esc>:syntax sync fromstart<CR>
inoremap <F12> <C-o>:syntax sync fromstart<CR>

set t_Co=256
colorscheme ir_black

" Terminal colors http://blog.infinitered.com/entries/show/6
set background=dark " Do this after colorscheme. It doesn't work before.

set relativenumber

set hlsearch
set incsearch

set nowrap

set autoindent
set smartindent
set title
set mouse=a

" We're modern. Send more characters!
set ttyfast

" Hide buffers instead of closing.
set hidden

" See :h listchars
set listchars=tab:>.,trail:.,extends:#,nbsp:.

set pastetoggle=<F2>

" Let F3 toggle the NERDTree
map <F3> :NERDTreeToggle<CR>

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
set scrolloff=3
set sidescroll=1
set sidescrolloff=3

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
" Jinja files
autocmd BufNewFile,BufRead *.jinja,*.jinja2 setf htmljinja
" Nginx config
au BufRead,BufNewFile nginx.conf set filetype=nginx

set expandtab

if has('autocmd')
else
    set tabstop=4
    set shiftwidth=4
endif

" Sparkup no conflict with autocomplete
let g:sparkupNextMapping = '<c-x>'

" Cursor line in active window
nnoremap <Leader>c :set cursorline! cursorcolumn!<CR>
autocmd WinLeave * set nocursorline
autocmd WinEnter * set cursorline
set cursorline

" Automatic leave paste mode
au InsertEnter * set paste
au InsertLeave * set nopaste

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
set foldmethod=indent

" I can type :help on my own, thanks.
noremap <F1> <nop>
" I can also type :ex and :man
noremap Q <nop>
noremap K <nop>

" Allow moving into blank space in virtual
set virtualedit=block

" Split in intuitive direction
set splitbelow
set splitright

" Don't skip lines when wrapped
nnoremap j gj
nnoremap k gk
nnoremap gj j
nnoremap gk k
" wrap on word instead of character
set linebreak

" ShowMarks plugin configuration
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

" Restore sessions when entering vim without arguments
" save and close all files and save global session
nnoremap <leader>qs :mksession! ~/.vim/saved_session.vim<CR>:wqa<CR>
" close all files without saving and save global session
nnoremap <leader>www :mksession! ~/.vim/saved_session.vim<CR>:qa!<CR>

function! RestoreSession()
  " vim called without arguments
  let restorefile='~/.vim/saved_session.vim'
  if argc() == 0 && filereadable(restorefile)
    execute 'source '.restorefile
  end
endfunction
autocmd VimEnter * call RestoreSession()
