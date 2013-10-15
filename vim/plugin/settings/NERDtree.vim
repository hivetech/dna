" Make nerdtree look nice
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1
let g:NERDTreeWinSize = 30

map <F4> :NERDTreeToggle<CR>
let NERDTreeIgnore=['\~$', '\.pyc$', '\.pyo$', '\.class$', 'pip-log\.txt$', '\.o$']
"nmap wm :NERDTree<cr>
let NERDTreeIgnore=['\.swp$']

nnoremap <silent> <C-\> :NERDTreeFind<CR>:vertical res 30<CR>
