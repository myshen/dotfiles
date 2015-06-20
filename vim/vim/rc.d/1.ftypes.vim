autocmd BufRead,BufNewFile *.feature set filetype=feature
au! Syntax newlang source $VIM/syntax/feature.vim
autocmd BufNewFile,BufRead *.py set filetype=python
autocmd BufNewFile,BufRead *.less set filetype=css
" CSV files
autocmd BufNewFile,BufRead *.csv set filetype=csv
" HTML files
autocmd BufNewFile,BufRead *.html.erb set filetype=eruby
" Jinja files
autocmd BufNewFile,BufRead *.j2,*.jinja,*.jinja2 set filetype=htmljinja
" json file
autocmd BufNewFile,BufRead *.json set filetype=json syntax=javascript
"  equalprg=json_reformat
" Nginx config
autocmd BufNewFile,BufRead nginx.conf set filetype=nginx
