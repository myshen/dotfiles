setlocal tabstop=2
setlocal shiftwidth=2
setlocal expandtab
setlocal foldmethod=indent

" Dependency: shellcheck
" https://jezenthomas.com/shell-script-static-analysis-in-vim/
" 2059 - printf %s
setlocal makeprg=shellcheck\ -e\ SC1090,SC2059\ -f\ gcc\ %
augroup sh
  autocmd!
" autocmd BufWritePost * :silent make | redraw!
" autocmd QuickFixCmdPost [^l]* nested cwindow
" autocmd QuickFixCmdPost    l* nested lwindow
augroup END

nnoremap <localleader>C :make<cr><cr>

inoremap Sif if [[  ]]; then<cr>fi<esc>kf]hi
inoremap Sv local x=""<esc>Fxcl
