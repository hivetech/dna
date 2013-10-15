let g:ctrlp_custom_ignore = '\.git$\|\.hg$\|\.svn$'
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files . --cached --exclude-standard --others']

" Default to filename searches - so that appctrl will find application
" controller
let g:ctrlp_by_filename = 1

" We don't want to use Ctrl-p as the mapping because
" it interferes with YankRing (paste, then hit ctrl-p)
let g:ctrlp_map = ',v'
nnoremap <silent> ,v :CtrlPMixed<CR>

" Clear the cache
nnoremap <silent> <C-l> :ClearCtrlPCache<cr>

" Idea from : http://www.charlietanksley.net/blog/blog/2011/10/18/vim-navigation-with-lustyexplorer-and-lustyjuggler/
" Open CtrlP starting from a particular path, making it much
" more likely to find the correct thing first. mnemonic 'jump to [something]'
" Example use:
map ,jl :CtrlP lib<CR>
map ,jC :CtrlP config<CR>

"Ctrl-m is not good - it overrides behavior of Enter
nnoremap <silent> <C-M> :CtrlPBufTag<CR>
