" Display state
let reminderDisplay = 0

" Read and show the reminder
function! Reminder()
    if g:reminderDisplay == 0
        silent! topleft vertical 40split +buffer Reminder
        let g:reminderDisplay = 1
        set buftype=nofile
        0read $HOME/.vim/plugin/reminder.txt
        set nonumber
        highlight Memory ctermfg=white ctermbg=blue
        3match Memory /^.\+\ \+:/
    else
        bdelete Reminder
        let g:reminderDisplay = 0
    endif
endfunction

" Default shortcut
if !hasmapto('<Plug>Reminder')
    map <unique> <F2> <Plug>Reminder
    imap <unique> <F2> <Plug>Reminder
endif

nnoremap <unique> <script> <Plug>Reminder :call Reminder()<CR>
" }}}
