nnoremap <localleader>G :set operatorfunc=<SID>GrepOperator<cr>g@
vnoremap <localleader>G :<c-u>call <SID>GrepOperator(visualmode())<cr>

function! s:GrepOperator(type)
    let saved_unamed_register = @@
    if a:type ==# 'v'
        normal! `<v`>y
    elseif a:type ==# 'char'
        normal! `[y`]
    else
        return
    endif

    silent execute "grep! -R " . shellescape(@@) . " ."
    let @@ = saved_unamed_register
endfunction
