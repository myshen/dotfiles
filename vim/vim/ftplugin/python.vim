" let g:detectindent_preferred_indent = 4
" let g:detectindent_preferred_when_mixed = 1

" setlocal tabstop=4
" setlocal softtabstop=4
" setlocal shiftwidth=4
" setlocal textwidth=80 " overridden by pymode_options
" setlocal expandtab
" setlocal smarttab
" setlocal smartindent cinwords=if,elif,else,for,while,try,except,finally,def,class
" setlocal foldmethod=indent

" " Python-mode
" " Activate rope
" " Keys:
" " K             Show python docs
" " <Ctrl-Space>  Rope autocomplete
" " <Ctrl-c>g     Rope goto definition
" " <Ctrl-c>d     Rope show documentation
" " <Ctrl-c>f     Rope find occurrences
" " <Leader>b     Set, unset breakpoint (g:pymode_breakpoint enabled)
" " [[            Jump on previous class or function (normal, visual, operator modes)
" " ]]            Jump on next class or function (normal, visual, operator modes)
" " [M            Jump on previous class or method (normal, visual, operator modes)
" " ]M            Jump on next class or method (normal, visual, operator modes)
" let g:pymode_options = 1
" let g:pymode_motion = 1
" let g:pymode_folding = 1

" let g:pymode_rope = 1
" let g:pymode_rope_complete_on_dot=0
" let g:pymode_rope_goto_definition_bind="<C-]>"
" let g:pymode_rope_lookup_project = 0
" let g:pymode_rope_regenerate_on_write = 0

" " Documentation
" let g:pymode_doc = 1
" let g:pymode_doc_bind="<C-S-d>"

" "Linting
" let g:pymode_lint = 1
" "let g:pymode_lint_checkers = ['pylint', 'pyflakes', 'pep8']
" let g:pymode_lint_checkers = ['pylint']
" let g:pymode_lint_cwindow = 1
" let g:pymode_lint_message = 1
" let g:pymode_lint_sort = ['E', 'W', 'C', 'I']
" " let g:pymode_lint_ignore = "C0301,W0312"
" let g:pymode_lint_ignore = "W0312"
" " C0301 - pylint
" " W0312 - pylint tabs
" " W191 - tabs

" " Auto check on save
" let g:pymode_lint_on_write = 0

" " Support virtualenv
" let g:pymode_virtualenv = 1

" " Enable breakpoints plugin
" let g:pymode_breakpoint = 1
" let g:pymode_breakpoint_key = '<leader>b'

" " syntax highlighting
" let g:pymode_syntax = 1
" let g:pymode_syntax_all = 1
" "let g:pymode_syntax_print_as_function = 1
" "let g:pymode_syntax_highlight_equal_operator = g:pymode_syntax_all
" "let g:pymode_syntax_highlight_stars_operator = g:pymode_syntax_all
" "let g:pymode_syntax_highlight_sself = g:pymode_syntax_all
" "let g:pymode_syntax_indent_errors = g:pymode_syntax_all
" "let g:pymode_syntax_space_errors = g:pymode_syntax_all

" " " Don't autofold code
" " let g:pymode_folding = 0


" Overwrite macvim's python style which sets tabs to 8 spaces.
let g:python_recommended_style = 0
setlocal softtabstop=4 tabstop=4


" BracelessEnable +indent +fold +highlight
BracelessEnable +indent


nmap <localleader>pr print(repr())<Esc>F(a
nmap <localleader>rr <Esc>bcsw)irepr<Esc>f(l
nmap <localleader>B <Esc>Oimport ipdb; ipdb.set_trace()  # XXX debug<Esc>==:w<CR>

let g:jedi#popup_on_dot=0


" Syntax checking
setlocal errorformat=%f:%l:\ %m
setlocal makeprg=pylint\ --rcfile=~/git-hooks/pylintrc\ --jobs=4\ --reports=n\ --output-format=parseable
nnoremap <localleader>L :make %:p<cr><cr>

" nnoremap <localleader>L :PymodeLint<cr>


nnoremap <localleader>c :Coveragepy show<cr>
nnoremap <localleader><tab> <Esc>:%s/	/    /g<CR>


nnoremap <localleader>tda <Esc>:DjangoTestApp<CR>
nnoremap <localleader>tdf <Esc>:DjangoTestFile<CR>
nnoremap <localleader>tdc <Esc>:DjangoTestClass<CR>
nnoremap <localleader>tdm <Esc>:DjangoTestMethod<CR>

nnoremap <localleader>tF <Esc>:Pytest file<CR>
nnoremap <localleader>tFs <Esc>:Pytest file -s<CR>
nnoremap <localleader>tc <Esc>:Pytest class<CR>
nnoremap <localleader>tcs <Esc>:Pytest class -s<CR>
nnoremap <localleader>tm <Esc>:Pytest method<CR>
nnoremap <localleader>tms <Esc>:Pytest method -s<CR>
nnoremap <localleader>tf <Esc>:Pytest function<CR>
nnoremap <localleader>tfs <Esc>:Pytest function -s<CR>

nnoremap <localleader>te <Esc><Esc>:Pytest error<CR>
nnoremap <localleader>ts <Esc><Esc>:Pytest session<CR>
nnoremap <localleader>tl <Esc>:RerunLastTests<CR>
nnoremap <localleader>t0 <Esc><Esc>:Pytest first<CR>
nnoremap <localleader>tn <Esc><Esc>:Pytest next<CR>
nnoremap <localleader>t$ <Esc><Esc>:Pytest last<CR>


map <C-Y> :call yapf#YAPF()<CR>
imap <C-Y> <c-o>:call yapf#YAPF()<CR>

iabbrev <buffer> Repr repr

let g:ale_linters = {
\  'python': ['pylint', 'autopep8', 'mypy', 'yapf'],
\}
" \  'python': ['pylint', 'autopep8', 'flake8', 'mypy', 'yapf'],
