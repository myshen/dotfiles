" setlocal foldmethod=indent
setlocal tabstop=4
setlocal softtabstop=4
setlocal shiftwidth=4
" setlocal textwidth=80 " overridden by pymode_options
setlocal smarttab
setlocal expandtab
setlocal smartindent cinwords=if,elif,else,for,while,try,except,finally,def,class

" Python-mode
" Activate rope
" Keys:
" K             Show python docs
" <Ctrl-Space>  Rope autocomplete
" <Ctrl-c>g     Rope goto definition
" <Ctrl-c>d     Rope show documentation
" <Ctrl-c>f     Rope find occurrences
" <Leader>b     Set, unset breakpoint (g:pymode_breakpoint enabled)
" [[            Jump on previous class or function (normal, visual, operator modes)
" ]]            Jump on next class or function (normal, visual, operator modes)
" [M            Jump on previous class or method (normal, visual, operator modes)
" ]M            Jump on next class or method (normal, visual, operator modes)
let g:pymode_options = 1
let g:pymode_motion = 1
let g:pymode_folding = 1

let g:pymode_rope = 1
let g:pymode_rope_complete_on_dot=0
let g:pymode_rope_goto_definition_bind="<C-]>"
let g:pymode_rope_lookup_project = 0

" Documentation
let g:pymode_doc = 1
let g:pymode_doc_bind="<C-S-d>"

"Linting
let g:pymode_lint = 1
let g:pymode_lint_checker = "pyflakes,pep8"
let g:pymode_lint_cwindow = 1
let g:pymode_lint_message = 1
let g:pymode_lint_sort = ['E', 'W', 'C', 'I']

" Auto check on save
let g:pymode_lint_write = 1

" Support virtualenv
let g:pymode_virtualenv = 1

" Enable breakpoints plugin
let g:pymode_breakpoint = 1
let g:pymode_breakpoint_key = '<leader>b'

" syntax highlighting
let g:pymode_syntax = 1
let g:pymode_syntax_all = 1
let g:pymode_syntax_print_as_function = 1
let g:pymode_syntax_highlight_equal_operator = g:pymode_syntax_all
let g:pymode_syntax_highlight_stars_operator = g:pymode_syntax_all
let g:pymode_syntax_highlight_sself = g:pymode_syntax_all
let g:pymode_syntax_indent_errors = g:pymode_syntax_all
let g:pymode_syntax_space_errors = g:pymode_syntax_all

" " Don't autofold code
" let g:pymode_folding = 0

nmap <Leader>pr iprint(repr())<Esc>F(a
nnoremap <leader>C :PymodeLint<cr>
nnoremap <leader>n :! nosetests --nocapture<cr>

nnoremap <Leader>da :DjangoTestApp<CR>
nnoremap <Leader>df :DjangoTestFile<CR>
nnoremap <Leader>dc :DjangoTestClass<CR>
nnoremap <Leader>dm :DjangoTestMethod<CR>
nnoremap <Leader>nf :NosetestFile<CR>
nnoremap <Leader>nc :NosetestClass<CR>
nnoremap <Leader>nm :NosetestMethod<CR>
nnoremap <Leader>nb :NosetestBaseMethod<CR>
nnoremap <Leader>nl :RerunLastTests<CR>
