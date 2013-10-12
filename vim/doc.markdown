Hivetech Vim distribution
=========================

General
-------

**Experimental** Giving a shot at [Vundle](https://github.com/gmarik/vundle).
Installation of Vundle itself and plugin is automatic thanks to [Erik
Zaadi](http://www.erikzaadi.com/2012/03/19/auto-installing-vundle-from-your-vimrc/).
Check `.vim/plugin/bundles.vim` to review the process and the plugin lists.

If present, before.vimrc and after.vimrc will be loaded.


Vimrc
-----

* General
    
    * \<F2\> : show help window
    * Leader key : ","
    * Back to normal mode : "ii"
    * Autojump to last position when opening a file
    * ",w" : saves the file
    * <space> to search, <ctrl>+<space> backwards, // to remove highlight
    * ",N" opens a new file
    * ",ss" toggle spell checking
    * ",cd" move working directory into current one
    * \<C-c\> Copy to clipboard
    * \<C-v\> Paste to clipboard
    * ",v" opens ctrlp files list
    * \<CR\> opens ctrlp tags
    * "{ss,vv}" : splits window
    * ",vr" : source .vimrc

* Dev

    * \<F5\> triggers make
    * \<F12\> triggers make run
    * ",{o,n,p,c}" : Manage debug window
    * ",h" : Toggle between header and source files
    * ",{character}" : Surround the word with {character}
    * ";;" : adds ; at the end of the line
    * \<C-a\> : puts the cursor after last "
    * ",gg" : opens a gitgrep line
    * \<C-A\>{character} : Align on {character}

* Move

    * \<C-{e,y}\> moves 4 lines {forward,backward}
    * {right,left} arrow navigates buffers
    * {up,down} arrow navigates windows
