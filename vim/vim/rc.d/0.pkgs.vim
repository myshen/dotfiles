" Note: Skip initialization for vim-tiny or vim-small.
if 0 | endif

if has('vim_starting')
  if &compatible
    set nocompatible               " Be iMproved
  endif

  " Required:
  set runtimepath+=~/.vim/bundle/dein.vim/repos/github.com/Shougo/dein.vim
endif

" Required:
call dein#begin(expand('~/.vim/bundle/dein.vim'))

" ui
call dein#add('chriskempson/base16-vim')
call dein#add('tpope/vim-sensible')
call dein#add('bling/vim-airline')
call dein#add('tmux-plugins/vim-tmux')
call dein#add('ConradIrwin/vim-bracketed-paste')  " supposedly allows direct pasting

" general improvements
call dein#add('tpope/vim-dispatch')  " async build/test dispatcher
call dein#add('tpope/vim-repeat')
call dein#add('tpope/vim-commentary')
call dein#add('tpope/vim-characterize')  " Show unicode info on 'ga'
" <c-w>o toggles window as only
call dein#add('vim-scripts/ZoomWin')  " http://vim.sourceforge.net/scripts/script.php?script_id=508
"call dein#add('thenoseman/vim-matchit')

" indentation
call dein#add('vim-scripts/IndentConsistencyCopAutoCmds') " http://www.vim.org/scripts/script.php?script_id=1691
" call dein#add('luochen1990/indent-detector.vim')
" call dein#add('ciaranm/detectindent')
" sleuth overrides python tabstop to 8 :(
call dein#add('tpope/vim-sleuth')

" naviagte buffers
call dein#add('christoomey/vim-tmux-navigator')
" call dein#add('tpope/vim-vinegar')
call dein#add('justinmk/vim-dirvish')
" call dein#add('kien/ctrlp.vim')
call dein#add('tpope/vim-eunuch') " Mkdir, Rename, Find, Move, Wall
call dein#add('sjl/gundo.vim') " show undo tree

" TODO https://github.com/ervandew/supertab
call dein#add('mhinz/vim-grepper')

call dein#add('romainl/vim-qf')
nnoremap <leader>git :Grepper -tool git -noswitch<cr>
nnoremap <leader>ag  :Grepper -tool ag  -grepprg ag --vimgrep -G '^.+\.txt'<cr>
nnoremap <leader>*   :Grepper -tool ack -cword -noprompt<cr>
command! -nargs=* -complete=file GG Grepper -tool git -query <args>
command! -nargs=* Ag Grepper -noprompt -tool ag -grepprg ag --vimgrep <args> %
nmap gs <plug>(GrepperOperator)
xmap gs <plug>(GrepperOperator)


" navigation
call dein#add('vim-scripts/ag.vim')
call dein#add('terryma/vim-expand-region')
call dein#add('majutsushi/tagbar')
" call dein#add('zakj/vim-showmarks')
" call dein#add('scrooloose/nerdtree')
" call dein#add('justinmk/vim-sneak')

" coverage
call dein#add('alfredodeza/coveragepy.vim')

" git
call dein#add('tpope/vim-fugitive')
call dein#add('twe4ked/vim-diff-toggle')
"call dein#add('airblade/vim-gitgutter')

" pairs
call dein#add('tpope/vim-surround')
call dein#add('jiangmiao/auto-pairs')
call dein#add('Raimondi/delimitMate')

" corrections
call dein#add('tpope/vim-abolish')
" call dein#add('panozzaj/vim-autocorrect')

" snippets
" call dein#add('SirVer/ultisnips')
" call dein#add('honza/vim-snippets')

" syntax
call dein#add('Chiel92/vim-autoformat')

" session
call dein#add('tpope/vim-obsession')

" golang
call dein#add('fatih/vim-go', {"on_ft": "go"})

" python
call dein#add('nathanaelkane/vim-indent-guides', {"on_ft": "python"})
call dein#add('tweekmonster/braceless.vim', {"on_ft": "python"})
call dein#add('davidhalter/jedi-vim', {"on_ft": "python"})
call dein#add('alfredodeza/pytest.vim', {"on_ft": "python"})
"call dein#add('vim-scripts/ini-syntax-definition', {"on_ft": "python"})
"call dein#add('vim-scripts/Pydiction', {"on_ft": "python"})
"call dein#add('hynek/vim-python-pep8-indent', {"on_ft": "python"})
" call dein#add('klen/python-mode', {"on_ft": "python"})
" call dein#add('JarrodCTaylor/vim-python-test-runner', {"on_ft": "python"})
" Shows python class method, etc
" call dein#add('mgedmin/pythonhelper.vim', {"on_ft": "python"})

" ruby
" call dein#add('vim-ruby/vim-ruby')

call dein#add('othree/xml.vim')
"call dein#add('bingaman/vim-sparkup')
"call dein#add('tpope/vim-ragtag')
"call dein#add('scrooloose/syntastic')
"call dein#add('FredKSchott/CoVim')
"call dein#add('Shougo/unite.vim')

" unorganized I am
call dein#add('elzr/vim-json')
call dein#add('ekalinin/Dockerfile.vim')
"call dein#add('vim-scripts/taglist.vim')
" call dein#add('danro/rename.vim') " rename a file, may be obsoleted by vim-eunuch
" call dein#add('29decibel/vim-stringify') " Convert html template into strings
" call dein#add('robmiller/vim-movar') " move around/inside variable
" call dein#add('tpope/vim-unimpaired') " need a cheat sheet for this one
" call dein#add('bkad/CamelCaseMotion')
" call dein#add('julienr/vim-cellmode') " VimuxRun[Last]Command

call dein#end()

" Required:
filetype plugin indent on

" CALL THIS IF PACKAGES HAVE BEEN UPDATED
" call dein#recache_runtimepath()
" Install!
" call dein#install()
