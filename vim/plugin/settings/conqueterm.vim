let g:ConqueTerm_InsertOnEnter = 0
let g:ConqueTerm_CWInsert = 1
let g:ConqueTerm_Color = 2
let g:ConqueTerm_ReadUnfocused = 1 " update conqueterm buffer while we're not looking (for running tests)

" Open up a variety of commands in the ConqueTerm
nmap <silent> <Leader>ty :execute 'ConqueTermSplit ipython'<CR>
nmap <silent> <Leader>tb :execute 'ConqueTermSplit bash'<CR>
nmap <silent> <Leader>tz :execute 'ConqueTermSplit zsh'<CR>
nmap <silent> <Leader>ts :execute 'ConqueTermSplit mysql -u root -p'<CR>
nmap <silent> <Leader>tn :execute 'ConqueTermSplit node'<CR>
nmap <silent> <Leader>ti :execute 'ConqueTermSplit irb'<CR>
nmap <silent> <Leader>tr :execute 'ConqueTermSplit R'<CR>

let g:ConqueTerm_SendVisKey = '<Leader>e'
