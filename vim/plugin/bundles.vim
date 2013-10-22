" Hivetech Vim distribution plugins, for Vundle (https://github.com/gmarik/vundle)
function! LoadBundles()

    " Core plugins -------------------------------------
    Bundle 'Syntastic'
    Bundle 'altercation/vim-colors-solarized'
    Bundle 'Raimondi/delimitMate'
    Bundle 'https://github.com/tpope/vim-fugitive'
    Bundle 'https://github.com/kien/ctrlp.vim'
    Bundle 'https://github.com/sjl/gundo.vim'
    Bundle 'https://github.com/vim-scripts/Conque-Shell'
    Bundle 'https://github.com/fholgado/minibufexpl.vim'
    Bundle 'https://github.com/scrooloose/nerdcommenter'
    Bundle 'https://github.com/scrooloose/nerdtree'
    Bundle 'https://github.com/jistr/vim-nerdtree-tabs'
    Bundle 'https://github.com/honza/vim-snippets'
    Bundle 'https://github.com/godlygeek/tabular'
    Bundle 'https://github.com/majutsushi/tagbar'
    Bundle 'https://github.com/vim-scripts/TaskList.vim'
    Bundle 'https://github.com/aperezdc/vim-template'
    Bundle 'https://github.com/tomtom/tlib_vim'
    Bundle 'https://github.com/vim-scripts/YankRing.vim'
    Bundle 'https://github.com/airblade/vim-gitgutter'
    Bundle 'bling/vim-airline'
    " --------------------------------------------------

    " Extra plugins ------------------------------------
    " --------------------------------------------------

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

    filetype on   " set it back
" Setting up Vundle - the vim plugin bundler end
