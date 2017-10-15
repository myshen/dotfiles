augroup manual_ftdetect

autocmd!

autocmd BufNewFile,BufRead *.feature set filetype=feature
autocmd BufNewFile,BufRead *.py set filetype=python
autocmd BufNewFile,BufRead *.less set filetype=css
" CSV files
autocmd BufNewFile,BufRead *.csv set filetype=csv
autocmd BufNewFile,BufRead *.md set filetype=markdown
" HTML files
autocmd BufNewFile,BufRead *.html.erb set filetype=eruby
" Jinja files
autocmd BufNewFile,BufRead *.j2,*.jinja,*.jinja2 set filetype=htmljinja
" json file
autocmd BufNewFile,BufRead *.json set filetype=json syntax=javascript
"  equalprg=json_reformat
" Nginx config
autocmd BufNewFile,BufRead nginx.conf set filetype=nginx
" puppet
autocmd BufNewFile,BufRead *.pp set filetype=puppet syntax=ruby
" perl tests
autocmd BufNewFile,BufRead *.t set filetype=perl syntax=perl

augroup END
