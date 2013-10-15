augroup filetypedetect
    autocmd BufRead,BufNewFile *.tex set textwidth=79
    autocmd BufRead,BufNewFile *.pde setfiletype arduino
    autocmd BufRead,BufNewFile *.ino setfiletype arduino
    autocmd FileType matlab setlocal keywordprg=info\ octave\ --vi-keys\ --index-search
augroup END
