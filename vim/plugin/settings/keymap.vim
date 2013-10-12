" Arpeggio lets us define key-chord combos (simultaneous key presses)
"TODO Checker arpeggio utilitée
"call arpeggio#load()

" ========================================
" General vim sanity improvements
" ========================================
" alias yw to yank the entire word 'yank inner word'
" even if the cursor is halfway inside the word
" FIXME: will not properly repeat when you use a dot (tie into repeat.vim)
nnoremap ,yw yiww

" ,ow = 'overwrite word', replace a word with what's in the yank buffer
" FIXME: will not properly repeat when you use a dot (tie into repeat.vim)
nnoremap ,ow "_diwhp

"make Y consistent with C and D
nnoremap Y y$

" ========================================
" RSI Prevention - keyboard remaps
" ========================================
" Certain things we do every day as programmers stress
" out our hands. For example, typing underscores and
" dashes are very common, and in position that require
" a lot of hand movement. Vim to the rescue
"
" Now using the middle finger of either hand you can type
" underscores with apple-k or apple-d, and add Shift
" to type dashes
"imap <silent> <C-d> _
"imap <silent> <C-D> -

" ,# Surround a word with #{ruby interpolation}
map ,# ysiw#
vmap ,# c#{<C-R>"}<ESC>

" ," Surround a word with "quotes"
map ," ysiw"
vmap ," c"<C-R>""<ESC>

" ,' Surround a word with 'single quotes'
map ,' ysiw'
vmap ,' c'<C-R>"'<ESC>

" ,) or ,( Surround a word with (parens)
" The difference is in whether a space is put in
map ,( ysiw(
map ,) ysiw)
vmap ,( c( <C-R>" )<ESC>
vmap ,) c(<C-R>")<ESC>

" ,[ Surround a word with [brackets]
map ,] ysiw]
map ,[ ysiw[
vmap ,[ c[ <C-R>" ]<ESC>
vmap ,] c[<C-R>"]<ESC>

" ,{ Surround a word with {braces}
map ,} ysiw}
map ,{ ysiw{
vmap ,} c{ <C-R>" }]9<ESC>
vmap ,{ c{<C-R>"}<ESC>

" gary bernhardt's hashrocket
" Semicolon at end of line by typing ;;
inoremap ;; <C-o>A;<esc>

"Go to last edit location with ,.
nnoremap ,. '.

"When typing a string, your quotes auto complete. Move past the quote
"while still in insert mode by hitting Ctrl-a. Example:
"
" type 'foo<c-a>
"
" the first quote will autoclose so you'll get 'foo' and hitting <c-a> will
" put the cursor right after the quote
imap <C-a> <esc>wa

" Compilation stuff
map <F5> :make<CR>
map <F12> :!make run<CR>

"Key mapping for compilation error navigation
nnoremap <leader>o <Esc>:copen<CR>
nnoremap <leader>p <Esc>:cprevious<CR>
nnoremap <leader>n <Esc>:cnext<CR>
nnoremap <leader>c <Esc>:cclose<CR>

"GitGrep - open up a git grep line, with a quote started for the search
nnoremap ,gg :GitGrep ""<left>

" ==============================
" Window/Tab/Split Manipulation
" ==============================
" Move between split windows by using the four directions H, L, I, N
" (note that  I use I and N instead of J and K because  J already does
" line joins and K is mapped to GitGrep the current word

" Zoom in and out of current window with ,gz
map <silent> ,gz <C-w>o

" Create window splits easier. The default way is Ctrl-w,v and Ctrl-w,s. I
" remap this to vv and ss
nnoremap <silent> vv <C-w>v
nnoremap <silent> ss <C-w>s

" Resize windows with arrow keys
nnoremap <C-Up> <C-w>+
nnoremap <C-Down> <C-w>-
nnoremap <C-Left> <C-w><
nnoremap <C-Right>  <C-w>>

" ============================
" Shortcuts for everyday tasks
" ============================
"(v)im (r)eload
nmap <silent> <leader>vr :so $MYVIMRC<CR>

" These are very similar keys. 
nnoremap ' `
nnoremap ` '

" ============================
" Tabularize - alignment
" ============================
" Hit Ctrl-A then type a character you want to align by
nmap <C-A> :Tabularize /
vmap <C-A> :Tabularize /

" ============================
" SplitJoin plugin
" ============================
nmap sj :SplitjoinSplit<cr>
nmap sk :SplitjoinJoin<cr>

" Out of rspec deleted file
nnoremap <silent> <leader>bf ^i{ <esc>$a }

" Remove windows end of line symbol
nmap <leader>wr :%s///g
