" Always show status bar, we have enough space
set laststatus=2

set number

set hlsearch
set incsearch
set smartcase

set autoindent
set title
set mouse=a

" We're modern. Send more characters!
set ttyfast
" Don't redraw when playing macros
set lazyredraw

" Hide buffers instead of closing.
set hidden

set listchars=tab:»\ ,eol:¬,trail:.,extends:#,nbsp:.

set pastetoggle=<F2>

set wildignore=*.o,*.obj,*.bak,*.exe,*.pyc
let g:netrw_list_hide = netrw_gitignore#Hide().'\(^\|\s\s\)\zs\.\S\+'
" nnoremap `'
" nnoremap '`
set history=50

set wildmenu
set wildmode=longest,list
set smartcase

" Briefly jump to the matched close block
set showmatch
set matchtime=0

set ruler
set showcmd
set showmode

" Keep more lines of context visible
set scrolloff=3
set sidescroll=1
set sidescrolloff=5

" xterm title
set title

" Make backspace delete intuitively
set backspace=indent,eol,start

" Be quiet
set noerrorbells
set shortmess+=I

" Put backup files and swap files in one place
set nobackup
set noswapfile
set backupdir=~/tmp,/tmp
set directory=~/tmp,/tmp

if has("mouse")
    set mouse=a
endif

" I can type
" :help
noremap <F1> <nop>
" :ex
noremap Q <nop>
" :man
noremap K <nop>

" retain selection in visual mode when indenting blocks
vnoremap < <gv
vnoremap > >gv

" Allow moving into blank space in virtual
set virtualedit=block

" Split in intuitive direction
set splitbelow
set splitright

" wrap lines and don't skip lines when moving the cursor
set nowrap
nnoremap j gj
nnoremap k gk
nnoremap gj j
nnoremap gk k
" wrap on words instead of on characters
set linebreak

" Jump to end of pasted text
vnoremap <silent> y y`]
vnoremap <silent> p p`]
nnoremap <silent> p p`]

" Stop that command window from popping up:
nnoremap q: :q`]`

augroup custom
    autocmd!
    " change dir for file completion
    " https://github.com/bag-man/dotfiles/blob/master/vimrc
    autocmd InsertEnter * let save_cwd = getcwd() | set autochdir
    autocmd InsertLeave * set noautochdir | execute 'cd' fnameescape(save_cwd)
augroup END

" auto complete file paths
imap <Tab> <C-X><C-F>

set path+=**
set foldignore=
