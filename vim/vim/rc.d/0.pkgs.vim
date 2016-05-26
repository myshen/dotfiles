" Note: Skip initialization for vim-tiny or vim-small.
if 0 | endif

if has('vim_starting')
  if &compatible
    set nocompatible               " Be iMproved
  endif

  " Required:
  set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

" Required:
call neobundle#begin(expand('~/.vim/bundle/'))

" Let NeoBundle manage NeoBundle
" Required:
NeoBundleFetch 'Shougo/neobundle.vim'

" visual
NeoBundle 'chriskempson/base16-vim'

" ui
NeoBundle 'tpope/vim-sensible'
NeoBundle 'bling/vim-airline'
NeoBundle 'ConradIrwin/vim-bracketed-paste'
NeoBundle 'tmux-plugins/vim-tmux'
" NeoBundle 'christoomey/vim-tmux-navigator'
NeoBundle 'vim-scripts/ag.vim'
NeoBundle 'vim-scripts/ZoomWin'

" indentation
NeoBundle 'vim-scripts/IndentConsistencyCopAutoCmds'
" NeoBundle 'luochen1990/indent-detector.vim'
NeoBundle 'ciaranm/detectindent'
" sleuth overrides python tabstop to 8 :(
" NeoBundle 'tpope/vim-sleuth'

" navigation
NeoBundle 'mileszs/ack.vim'
NeoBundle 'scrooloose/nerdtree'
NeoBundle 'majutsushi/tagbar'
NeoBundle 'zakj/vim-showmarks'
NeoBundle 'terryma/vim-expand-region'
NeoBundle 'justinmk/vim-sneak'

" Show unicode info on 'ga'
NeoBundle 'tpope/vim-characterize'

" git
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'twe4ked/vim-diff-toggle'
"NeoBundle 'airblade/vim-gitgutter'

"NeoBundle 'thenoseman/vim-matchit'
NeoBundle 'tpope/vim-repeat'
NeoBundle 'tpope/vim-commentary'

" pairs
NeoBundle 'tpope/vim-surround'
NeoBundle 'jiangmiao/auto-pairs'
NeoBundle 'Raimondi/delimitMate'

" corrections
NeoBundle 'tpope/vim-abolish'
" NeoBundle 'panozzaj/vim-autocorrect'

" snippets
NeoBundle 'SirVer/ultisnips'
NeoBundle 'honza/vim-snippets'

" syntax
NeoBundle 'Chiel92/vim-autoformat'

" session
NeoBundle 'tpope/vim-obsession'

" golang
NeoBundle 'fatih/vim-go'

NeoBundle 'nathanaelkane/vim-indent-guides'

" python
"NeoBundle 'vim-scripts/ini-syntax-definition'
"NeoBundle 'vim-scripts/Pydiction'
"NeoBundle 'hynek/vim-python-pep8-indent'
NeoBundle 'klen/python-mode'
NeoBundle 'tpope/vim-dispatch'
NeoBundle 'alfredodeza/pytest.vim'
" NeoBundle 'JarrodCTaylor/vim-python-test-runner'
" Shows python class method, etc
" NeoBundle 'mgedmin/pythonhelper.vim'

" ruby
NeoBundle 'vim-ruby/vim-ruby'

NeoBundle 'othree/xml.vim'
"NeoBundle 'bingaman/vim-sparkup'
"NeoBundle 'tpope/vim-ragtag'
NeoBundle 'scrooloose/syntastic'
"NeoBundle 'FredKSchott/CoVim'
"NeoBundle 'Shougo/unite.vim'

" unorganized I am
NeoBundle 'elzr/vim-json'
NeoBundle 'ekalinin/Dockerfile.vim'
"NeoBundle 'vim-scripts/taglist.vim'
" NeoBundle 'danro/rename.vim' " rename a file, may be obsoleted by vim-eunuch
NeoBundle 'tpope/vim-eunuch' " Mkdir, Rename, Find
" NeoBundle '29decibel/vim-stringify' " Convert html template into strings
NeoBundle 'sjl/gundo.vim' " show undo tree
" NeoBundle 'robmiller/vim-movar' " move around/inside variable
" NeoBundle 'tpope/vim-unimpaired' " need a cheat sheet for this one
" NeoBundle 'bkad/CamelCaseMotion'
" NeoBundle 'julienr/vim-cellmode' " VimuxRun[Last]Command

call neobundle#end()

" Required:
filetype plugin indent on

" If there are uninstalled bundles found on startup,
" this will conveniently prompt you to install them.
NeoBundleCheck
