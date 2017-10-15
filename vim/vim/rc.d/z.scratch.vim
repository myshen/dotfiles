" http://learnvimscriptthehardway.stevelosh.com/chapters/04.html

" learning vim
nnoremap <localleader>vl :vsplit ~/.vim/rc.d/z.scratch.vim<CR>

nnoremap <localleader>hw :match Error /\v\s+$/<cr>
nnoremap <localleader>g/ :silent execute "grep! -R " . shellescape(expand("<cWORD>")) . " ."<cr>

set shiftround

" upper the word
inoremap <c-t> <ESC>viw~i
nnoremap <c-t> viw~i<ESC>l
" inoremap <ESC> <nop>

" reformat current line but don't join it with the next one
nnoremap gqj gq$

" TODO
onoremap in@ :<c-u>execute "normal! /@\\S\\+/e\r:nohlsearch\rvT "<CR>
onoremap a@ :<c-u>execute "normal! /@\\S\\+/e\r:nohlsearch\rvF "<CR>

" prev buffer in split
nnoremap <localleader>pb :<c-u>execute "rightbelow vsplit". bufname('#')<CR>

" delete two lines, with undo break
nnoremap <localleader>D ddi<C-g>u<ESC>dd
" add trailing ;
nnoremap <localleader>; :execute "normal! mqA;\<esc>`q"


nnoremap <localleader>tf :call FoldColumnToggle()<cr>
function! FoldColumnToggle()
  if &foldcolumn
    setlocal foldcolumn=0
  else
    setlocal foldcolumn=4
  endif
endfunction

" http://learnvimscriptthehardway.stevelosh.com/chapters/49.html
function! NextNonBlankLine(lnum)
  let numlines = line('$')
  let current = a:lnum + 1

  while current <= numlines
    if getline(current) =~? '\v\S'
      return current
    endif

    let current += 1
  endwhile

  return -2
endfunction
function! IndentLevel(lnum)
    return indent(a:lnum) / &shiftwidth
endfunction


" http://andrewradev.com/2011/06/08/vim-and-ctags/
" https://www.fusionbox.com/blog/detail/navigating-your-django-project-with-vim-and-ctags/590/
set tags+=~/tags/
let g:autotagTagsFile='.tags'
let g:autotagCtagsCmd="ctags -R --fields=+l --languages=python --python-kinds=-iv -f ./tags $(python -c \"import os, sys; print(' '.join('{}'.format(d) for d in sys.path if os.path.isdir(d)))\")"
