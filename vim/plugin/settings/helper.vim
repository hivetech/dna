" Display state
let helperDisplay = 0

" Read and show the helper
function! Helper()
    if g:helperDisplay == 0
        silent! topleft vertical 40split +buffer Helper
        let g:helperDisplay = 1
        set buftype=nofile
        0read $HOME/.vim/plugin/helper.txt
        set nonumber
        highlight Memory ctermfg=white ctermbg=blue
        3match Memory /^.\+\ \+:/
    else
        bdelete Helper
        let g:helperDisplay = 0
    endif
endfunction

" Default shortcut
if !hasmapto('<Plug>Helper')
    map <unique> <F2> <Plug>Helper
    imap <unique> <F2> <Plug>Helper
endif

nnoremap <unique> <script> <Plug>Helper :call Helper()<CR>
" }}}
