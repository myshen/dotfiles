setlocal shiftwidth=2
setlocal tabstop=2
setlocal errorformat=%f:%l:%c:%m
setlocal makeprg=puppet-lint\ --error-level\ warning\ --log-format\ '\\\%{fullpath}:\\\%{line}:\\\%{kind}:\\\%{message}'\ $*\ %;\ puppet\ parser\ validate\ %
map <localleader>L :make<CR><CR>
"autocmd BufWritePost *.pp !puppet-lint % <cr>
