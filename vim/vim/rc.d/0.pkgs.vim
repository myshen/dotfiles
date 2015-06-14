" This must be first; it changes other options as side effects
set nocompatible
" Must turn off filetype before bundling setup
filetype off

if has('vim_starting')
  set runtimepath+=~/.vim/bundle/neobundle.vim/
endif
call neobundle#begin(expand('~/.vim/bundle/'))

" let NeoBundle manage NeoBundle
" required! 
NeoBundleFetch 'Shougo/neobundle.vim'

" visual
NeoBundle 'chriskempson/base16-vim'

" ui
NeoBundle 'bling/vim-airline'
NeoBundle 'ConradIrwin/vim-bracketed-paste'
NeoBundle 'tmux-plugins/vim-tmux'
" NeoBundle 'christoomey/vim-tmux-navigator'

" navigation
NeoBundle 'mileszs/ack.vim'
NeoBundle 'scrooloose/nerdtree'
NeoBundle 'majutsushi/tagbar'
NeoBundle 'zakj/vim-showmarks'

" Show unicode info on 'ga'
NeoBundle 'tpope/vim-characterize'

" git
NeoBundle 'tpope/vim-fugitive'
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

" golang
NeoBundle 'fatih/vim-go'

NeoBundle 'nathanaelkane/vim-indent-guides'

" python
"NeoBundle 'vim-scripts/ini-syntax-definition'
"NeoBundle 'vim-scripts/Pydiction'
"NeoBundle 'hynek/vim-python-pep8-indent'
NeoBundle 'klen/python-mode'
" Shows python class method, etc
"NeoBundle 'mgedmin/pythonhelper.vim'

" ruby
NeoBundle 'vim-ruby/vim-ruby'

NeoBundle 'othree/xml.vim'
"NeoBundle 'vim-scripts/taglist.vim'
"NeoBundle 'bingaman/vim-sparkup'
"NeoBundle 'tpope/vim-ragtag'
"NeoBundle 'scrooloose/syntastic'
"NeoBundle 'FredKSchott/CoVim'
"NeoBundle 'Shougo/unite.vim'

NeoBundle 'elzr/vim-json'
NeoBundle 'ekalinin/Dockerfile.vim'

call neobundle#end()

" Brief help
" :NeoBundleList          - list configured bundles
" :NeoBundleInstall(!)    - install(update) bundles
" :NeoBundleSearch(!) foo - search(or refresh cache first) for foo
" :NeoBundleClean(!)      - confirm(or auto-approve) removal of unused bundles

" Installation check
NeoBundleCheck

" Must happen after bundle setup
filetype plugin indent on
