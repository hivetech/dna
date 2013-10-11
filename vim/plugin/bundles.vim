" Hivetech Vim distribution plugins, for Vundle (https://github.com/gmarik/vundle)
function! LoadBundles()
    Bundle 'tpope/vim-fugitive'
    Bundle 'Syntastic'
    Bundle 'altercation/vim-colors-solarized' 
    Bundle 'https://github.com/tpope/vim-fugitive' 
    if executable('ack')
        Bundle 'mileszs/ack.vim'
    endif
endfunction

" Setting up Vundle - the vim plugin bundler
    let iCanHazVundle=1
    let vundle_readme=expand('~/.vim/bundle/vundle/README.md')
    if !filereadable(vundle_readme)
        echo "Installing Vundle.."
        echo ""
        silent !mkdir -p ~/.vim/bundle
        silent !git clone https://github.com/gmarik/vundle ~/.vim/bundle/vundle
        let iCanHazVundle=0
    endif
    filetype off   " Required for initialization
    set rtp+=~/.vim/bundle/vundle/
    call vundle#rc()
    Bundle 'gmarik/vundle'

    "Add your bundles here
    :call LoadBundles()

    if iCanHazVundle == 0
        echo "Installing Bundles, please ignore key map error messages"
        echo ""
        :BundleInstall
    endif
" Setting up Vundle - the vim plugin bundler end
