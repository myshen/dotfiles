" This must be first; it changes other options as side effects
set nocompatible

" Use pathogen to easily modify the runtime path to include all plugins under
" the ~/.vim/bundle directory
call pathogen#infect() 

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

filetype plugin indent on

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

" Restore sessions when entering vim without arguments
" save and close all files and save global session
nnoremap <leader>qs :mksession! ~/.vim/saved_session.vim<CR>:wqa<CR>
" close all files without saving and save global session
nnoremap <leader>www :mksession! ~/.vim/saved_session.vim<CR>:qa!<CR>

function! RestoreSession()
  " vim called without arguments
  if argc() == 0
    execute 'source ~/.vim/saved_session.vim'
  end
endfunction
autocmd VimEnter * call RestoreSession()
