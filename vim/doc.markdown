Hivetech Vim distribution
=========================

General
-------

Vim plugins are managed with pathogen.
**Experimental** Giving a shot at [Vundle](https://github.com/gmarik/vundle).
Installation of Vundle itself and plugin is automatic thanks to [Erik
Zaadi](http://www.erikzaadi.com/2012/03/19/auto-installing-vundle-from-your-vimrc/).
Check `.vim/plugin/bundles.vim` to review the process and the plugin lists.

If present, before.vimrc and after.vimrc will be loaded.


Vimrc
-----

* General
    
    * Leader key : ","
    * Back to normal mode : "ii"
    * Autojump to last position when opening a file
    * <space> to search, <ctrl>+<space> backwards, // to remove highlight
    * ",N" opens a new file
    * ",ss" toggle spell checking
    * ",cd" move working directory into current one
    * <C-c> Copy to clipboard
    * <C-v> Paste to clipboard

* Dev

    * <F5> triggers make
    * <F12> triggers make run
    * ",{o,n,p,c}" : Manage debug window
    * ",h" : Toggle between header and source files

* Move

    * <C-{e,y}> moves 4 lines {forward,backward}
    * {right,left} arrow navigates buffers
    * {up,down} arrow navigates windows


times in msec
 clock   self+sourced   self:  sourced script
 clock   elapsed:              other lines

000.011  000.011: --- VIM STARTING ---
000.275  000.264: Allocated generic buffers
000.486  000.211: locale set
019.754  019.268: GUI prepared
019.772  000.018: clipboard setup
019.801  000.029: window checked
021.626  001.825: inits 1
021.646  000.020: parsing arguments
021.650  000.004: expanding arguments
021.689  000.039: shell init
030.032  008.343: xsmp init
031.482  001.450: Termcap init
031.667  000.185: inits 2
032.084  000.417: init highlight
033.431  000.912  000.912: sourcing /usr/share/vim/vim73/debian.vim
034.895  000.827  000.827: sourcing /usr/share/vim/vim73/syntax/syncolor.vim
035.409  001.552  000.725: sourcing /usr/share/vim/vim73/syntax/synload.vim
066.605  030.973  030.973: sourcing /usr/share/vim/vim73/filetype.vim
066.666  033.021  000.496: sourcing /usr/share/vim/vim73/syntax/syntax.vim
066.702  034.428  000.495: sourcing $VIM/vimrc
067.052  000.249  000.249: sourcing /usr/share/vim/vim73/debian.vim
067.299  000.017  000.017: sourcing /home/xavier/.vim/autoload/pathogen.vim
067.649  000.449  000.432: sourcing /home/xavier/.vim/autoload/pathogen.vim
073.295  000.334  000.334: sourcing /usr/share/vim/vim73/ftoff.vim
094.572  000.409  000.409: sourcing /home/xavier/.vim/bundle/gitfiles/ftdetect/git.vim
094.754  000.096  000.096: sourcing /home/xavier/.vim/bundle/golang/ftdetect/gofiletype.vim
095.163  021.401  020.896: sourcing /usr/share/vim/vim73/filetype.vim
129.596  000.297  000.297: sourcing /usr/share/vim/vim73/syntax/nosyntax.vim
130.397  000.239  000.239: sourcing /usr/share/vim/vim73/syntax/syncolor.vim
130.562  000.676  000.437: sourcing /usr/share/vim/vim73/syntax/synload.vim
130.607  001.361  000.388: sourcing /usr/share/vim/vim73/syntax/syntax.vim
130.864  000.013  000.013: sourcing /usr/share/vim/vim73/filetype.vim
131.174  000.050  000.050: sourcing /usr/share/vim/vim73/ftplugin.vim
131.446  000.013  000.013: sourcing /usr/share/vim/vim73/filetype.vim
131.743  000.044  000.044: sourcing /usr/share/vim/vim73/indent.vim
132.134  065.377  041.463: sourcing $HOME/.vimrc
132.144  000.255: sourcing vimrc file(s)
134.599  001.503  001.503: sourcing /home/xavier/.vim/plugin/a.vim
135.905  001.268  001.268: sourcing /home/xavier/.vim/plugin/color_sample_pack.vim
136.668  000.683  000.683: sourcing /home/xavier/.vim/autoload/l9.vim
136.967  001.027  000.344: sourcing /home/xavier/.vim/plugin/l9.vim
140.511  003.494  003.494: sourcing /home/xavier/.vim/plugin/mimicpak.vim
142.368  001.445  001.445: sourcing /home/xavier/.vim/autoload/screen.vim
142.506  001.938  000.493: sourcing /home/xavier/.vim/plugin/screen.vim
142.576  000.023  000.023: sourcing /home/xavier/.vim/plugin/settings/NERDtree-tabs.vim
142.676  000.064  000.064: sourcing /home/xavier/.vim/plugin/settings/NERDtree.vim
142.742  000.027  000.027: sourcing /home/xavier/.vim/plugin/settings/Tlist.vim
142.846  000.068  000.068: sourcing /home/xavier/.vim/plugin/settings/abbr.vim
143.624  000.404  000.404: sourcing /home/xavier/.vim/bundle/solarized/autoload/togglebg.vim
145.951  000.337  000.337: sourcing /usr/share/vim/vim73/syntax/syncolor.vim
146.816  000.334  000.334: sourcing /usr/share/vim/vim73/syntax/syncolor.vim
150.482  006.507  005.836: sourcing /home/xavier/.vim/bundle/solarized/colors/solarized.vim
152.571  000.294  000.294: sourcing /usr/share/vim/vim73/syntax/syncolor.vim
153.336  000.290  000.290: sourcing /usr/share/vim/vim73/syntax/syncolor.vim
156.265  005.147  004.563: sourcing /home/xavier/.vim/bundle/solarized/colors/solarized.vim
157.096  014.214  002.156: sourcing /home/xavier/.vim/plugin/settings/appearance.vim
157.233  000.093  000.093: sourcing /home/xavier/.vim/plugin/settings/arduino.vim
157.275  000.012  000.012: sourcing /home/xavier/.vim/plugin/settings/autotag.vim
157.318  000.019  000.019: sourcing /home/xavier/.vim/plugin/settings/bufExpl.vim
157.389  000.047  000.047: sourcing /home/xavier/.vim/plugin/settings/camelcasemotion.vim
157.512  000.098  000.098: sourcing /home/xavier/.vim/plugin/settings/conqueterm.vim
157.626  000.063  000.063: sourcing /home/xavier/.vim/plugin/settings/ctrlp.vim
157.666  000.013  000.013: sourcing /home/xavier/.vim/plugin/settings/delimitmate.vim
158.399  000.599  000.599: sourcing /home/xavier/.vim/bundle/easymotion/autoload/EasyMotion.vim
158.563  000.872  000.273: sourcing /home/xavier/.vim/plugin/settings/easymotion.vim
158.770  000.174  000.174: sourcing /home/xavier/.vim/plugin/settings/filetype.vim
159.514  000.423  000.423: sourcing /usr/share/vim/vim73/ftoff.vim
160.022  000.027  000.027: sourcing /usr/share/vim/vim73/ftplugof.vim
160.353  000.025  000.025: sourcing /usr/share/vim/vim73/indoff.vim
181.590  000.414  000.414: sourcing /home/xavier/.vim/bundle/gitfiles/ftdetect/git.vim
181.767  000.098  000.098: sourcing /home/xavier/.vim/bundle/golang/ftdetect/gofiletype.vim
182.215  000.097  000.097: sourcing /opt/go/misc/vim/ftdetect/gofiletype.vim
182.326  021.687  021.078: sourcing /usr/share/vim/vim73/filetype.vim
182.653  000.050  000.050: sourcing /usr/share/vim/vim73/ftplugin.vim
182.961  000.044  000.044: sourcing /usr/share/vim/vim73/indent.vim
183.291  000.207  000.207: sourcing /usr/share/vim/vim73/syntax/nosyntax.vim
185.259  000.300  000.300: sourcing /usr/share/vim/vim73/syntax/syncolor.vim
186.019  000.294  000.294: sourcing /usr/share/vim/vim73/syntax/syncolor.vim
188.919  005.159  004.565: sourcing /home/xavier/.vim/bundle/solarized/colors/solarized.vim
190.248  006.695  001.536: sourcing /usr/share/vim/vim73/syntax/synload.vim
190.294  007.255  000.353: sourcing /usr/share/vim/vim73/syntax/syntax.vim
190.318  031.518  002.007: sourcing /home/xavier/.vim/plugin/settings/golang.vim
190.378  000.024  000.024: sourcing /home/xavier/.vim/plugin/settings/gundo.vim
190.416  000.010  000.010: sourcing /home/xavier/.vim/plugin/settings/instant-markdown.vim
190.883  000.363  000.363: sourcing /home/xavier/.vim/bundle/arpeggio/autoload/arpeggio.vim
191.714  000.741  000.741: sourcing /home/xavier/.vim/bundle/arpeggio/plugin/arpeggio.vim
192.305  001.863  000.759: sourcing /home/xavier/.vim/plugin/settings/keymap.vim
192.456  000.115  000.115: sourcing /home/xavier/.vim/plugin/settings/neocomplcache.vim
192.527  000.043  000.043: sourcing /home/xavier/.vim/plugin/settings/open-changed-files.vim
192.575  000.020  000.020: sourcing /home/xavier/.vim/plugin/settings/outerblock.vim
192.623  000.022  000.022: sourcing /home/xavier/.vim/plugin/settings/persistent-undo.vim
192.663  000.013  000.013: sourcing /home/xavier/.vim/plugin/settings/powerline.vim
277.361  084.674  084.674: sourcing /home/xavier/.vim/plugin/settings/pymode.vim
277.463  000.052  000.052: sourcing /home/xavier/.vim/plugin/settings/quickfix-search.vim
277.505  000.012  000.012: sourcing /home/xavier/.vim/plugin/settings/r.vim
277.610  000.079  000.079: sourcing /home/xavier/.vim/plugin/settings/reminder.vim
277.659  000.020  000.020: sourcing /home/xavier/.vim/plugin/settings/showmarks.vim
277.765  000.079  000.079: sourcing /home/xavier/.vim/plugin/settings/smart_jump_to_tag.vim
279.495  000.308  000.308: sourcing /usr/share/vim/vim73/syntax/syncolor.vim
280.287  000.320  000.320: sourcing /usr/share/vim/vim73/syntax/syncolor.vim
283.261  005.256  004.628: sourcing /home/xavier/.vim/bundle/solarized/colors/solarized.vim
285.118  007.325  002.069: sourcing /home/xavier/.vim/plugin/settings/solarized.vim
285.193  000.027  000.027: sourcing /home/xavier/.vim/plugin/settings/stop-visual-paste-insanity.vim
285.242  000.020  000.020: sourcing /home/xavier/.vim/plugin/settings/sudo-write.vim
285.293  000.025  000.025: sourcing /home/xavier/.vim/plugin/settings/surround.vim
285.345  000.027  000.027: sourcing /home/xavier/.vim/plugin/settings/syntastic.vim
285.389  000.020  000.020: sourcing /home/xavier/.vim/plugin/settings/tagbar.vim
285.451  000.037  000.037: sourcing /home/xavier/.vim/plugin/settings/unimpaired.vim
285.494  000.017  000.017: sourcing /home/xavier/.vim/plugin/settings/vim-indent-guides.vim
285.538  000.020  000.020: sourcing /home/xavier/.vim/plugin/settings/yankring.vim
286.582  000.952  000.952: sourcing /home/xavier/.vim/bundle/CamelCaseMotion/plugin/camelcasemotion.vim
700.256  413.543  413.543: sourcing /home/xavier/.vim/bundle/CoVim/plugin/CoVimClient.vim
700.733  000.354  000.354: sourcing /home/xavier/.vim/bundle/ConqueShell/plugin/conque_term.vim
701.842  001.024  001.024: sourcing /home/xavier/.vim/bundle/abolish/plugin/abolish.vim
702.156  000.228  000.228: sourcing /home/xavier/.vim/bundle/ack/plugin/ack.vim
702.445  000.177  000.177: sourcing /home/xavier/.vim/bundle/arduino/plugin/vim-arduino.vim
702.545  000.022  000.022: sourcing /home/xavier/.vim/bundle/arpeggio/plugin/arpeggio.vim
702.739  000.117  000.117: sourcing /home/xavier/.vim/bundle/change-inside-surroundings/plugin/change-inside-surroundings.vim
703.341  000.278  000.278: sourcing /home/xavier/.vim/bundle/ctrlp/autoload/ctrlp/mrufiles.vim
703.654  000.841  000.563: sourcing /home/xavier/.vim/bundle/ctrlp/plugin/ctrlp.vim
704.772  000.528  000.528: sourcing /home/xavier/.vim/bundle/delimitMate/autoload/delimitMate.vim
708.315  004.581  004.053: sourcing /home/xavier/.vim/bundle/delimitMate/plugin/delimitMate.vim
708.549  000.140  000.140: sourcing /home/xavier/.vim/bundle/dispatch/plugin/dispatch.vim
710.986  002.350  002.350: sourcing /home/xavier/.vim/bundle/easymotion/plugin/EasyMotion.vim
711.507  000.424  000.424: sourcing /home/xavier/.vim/bundle/endwise/plugin/endwise.vim
715.925  004.328  004.328: sourcing /home/xavier/.vim/bundle/fugitive/plugin/fugitive.vim
716.092  000.074  000.074: sourcing /home/xavier/.vim/bundle/gist/plugin/gist.vim
717.264  001.075  001.075: sourcing /home/xavier/.vim/bundle/gitgutter/plugin/gitgutter.vim
718.443  001.090  001.090: sourcing /home/xavier/.vim/bundle/gitv/plugin/gitv.vim
718.650  000.118  000.118: sourcing /home/xavier/.vim/bundle/golang/plugin/godoc.vim
718.814  000.069  000.069: sourcing /home/xavier/.vim/bundle/gundo/plugin/gundo.vim
719.329  000.433  000.433: sourcing /home/xavier/.vim/bundle/indexed-search/plugin/IndexedSearch.vim
719.782  000.286  000.286: sourcing /home/xavier/.vim/bundle/latex-suite/plugin/SyntaxFolds.vim
720.050  000.232  000.232: sourcing /home/xavier/.vim/bundle/latex-suite/plugin/filebrowser.vim
721.003  000.919  000.919: sourcing /home/xavier/.vim/bundle/latex-suite/plugin/imaps.vim
721.202  000.161  000.161: sourcing /home/xavier/.vim/bundle/latex-suite/plugin/libList.vim
721.380  000.145  000.145: sourcing /home/xavier/.vim/bundle/latex-suite/plugin/remoteOpen.vim
723.820  002.353  002.353: sourcing /home/xavier/.vim/bundle/minibufexpl/plugin/minibufexpl.vim
724.291  000.378  000.378: sourcing /home/xavier/.vim/bundle/multiple-cursors/plugin/multiple_cursors.vim
732.049  007.671  007.671: sourcing /home/xavier/.vim/bundle/nerdcommenter/plugin/NERD_commenter.vim
735.375  002.500  002.500: sourcing /home/xavier/.vim/bundle/nerdtree/autoload/nerdtree.vim
737.020  000.515  000.515: sourcing /home/xavier/.vim/bundle/nerdtree/lib/nerdtree/path.vim
737.363  000.149  000.149: sourcing /home/xavier/.vim/bundle/nerdtree/lib/nerdtree/menu_controller.vim
737.656  000.110  000.110: sourcing /home/xavier/.vim/bundle/nerdtree/lib/nerdtree/menu_item.vim
737.951  000.121  000.121: sourcing /home/xavier/.vim/bundle/nerdtree/lib/nerdtree/key_map.vim
738.387  000.258  000.258: sourcing /home/xavier/.vim/bundle/nerdtree/lib/nerdtree/bookmark.vim
738.964  000.387  000.387: sourcing /home/xavier/.vim/bundle/nerdtree/lib/nerdtree/tree_file_node.vim
739.612  000.459  000.459: sourcing /home/xavier/.vim/bundle/nerdtree/lib/nerdtree/tree_dir_node.vim
740.021  000.232  000.232: sourcing /home/xavier/.vim/bundle/nerdtree/lib/nerdtree/opener.vim
740.513  000.261  000.261: sourcing /home/xavier/.vim/bundle/nerdtree/lib/nerdtree/creator.vim
753.561  000.134  000.134: sourcing /home/xavier/.vim/bundle/nerdtree/nerdtree_plugin/exec_menuitem.vim
754.121  000.519  000.519: sourcing /home/xavier/.vim/bundle/nerdtree/nerdtree_plugin/fs_menu.vim
755.077  000.865  000.865: sourcing /home/xavier/.vim/bundle/nerdtree-tabs/nerdtree_plugin/vim-nerdtree-tabs.vim
755.475  023.327  016.817: sourcing /home/xavier/.vim/bundle/nerdtree/plugin/NERD_tree.vim
756.412  000.782  000.782: sourcing /home/xavier/.vim/bundle/surround/plugin/surround.vim
756.803  000.064  000.064: sourcing /home/xavier/.vim/bundle/syntastic/plugin/syntastic/autoloclist.vim
756.932  000.095  000.095: sourcing /home/xavier/.vim/bundle/syntastic/plugin/syntastic/balloons.vim
757.048  000.086  000.086: sourcing /home/xavier/.vim/bundle/syntastic/plugin/syntastic/checker.vim
757.153  000.077  000.077: sourcing /home/xavier/.vim/bundle/syntastic/plugin/syntastic/cursor.vim
757.267  000.084  000.084: sourcing /home/xavier/.vim/bundle/syntastic/plugin/syntastic/highlighting.vim
757.461  000.163  000.163: sourcing /home/xavier/.vim/bundle/syntastic/plugin/syntastic/loclist.vim
757.575  000.083  000.083: sourcing /home/xavier/.vim/bundle/syntastic/plugin/syntastic/makeprg_builder.vim
757.680  000.075  000.075: sourcing /home/xavier/.vim/bundle/syntastic/plugin/syntastic/modemap.vim
757.776  000.065  000.065: sourcing /home/xavier/.vim/bundle/syntastic/plugin/syntastic/notifiers.vim
758.023  000.220  000.220: sourcing /home/xavier/.vim/bundle/syntastic/plugin/syntastic/registry.vim
758.220  000.165  000.165: sourcing /home/xavier/.vim/bundle/syntastic/plugin/syntastic/signs.vim
758.745  000.012  000.012: sourcing /home/xavier/.vim/bundle/syntastic/plugin/syntastic/autoloclist.vim
758.784  000.010  000.010: sourcing /home/xavier/.vim/bundle/syntastic/plugin/syntastic/balloons.vim
758.819  000.009  000.009: sourcing /home/xavier/.vim/bundle/syntastic/plugin/syntastic/checker.vim
758.853  000.009  000.009: sourcing /home/xavier/.vim/bundle/syntastic/plugin/syntastic/cursor.vim
758.888  000.009  000.009: sourcing /home/xavier/.vim/bundle/syntastic/plugin/syntastic/highlighting.vim
758.922  000.009  000.009: sourcing /home/xavier/.vim/bundle/syntastic/plugin/syntastic/loclist.vim
758.967  000.015  000.015: sourcing /home/xavier/.vim/bundle/syntastic/plugin/syntastic/makeprg_builder.vim
759.006  000.010  000.010: sourcing /home/xavier/.vim/bundle/syntastic/plugin/syntastic/modemap.vim
759.039  000.008  000.008: sourcing /home/xavier/.vim/bundle/syntastic/plugin/syntastic/notifiers.vim
759.073  000.008  000.008: sourcing /home/xavier/.vim/bundle/syntastic/plugin/syntastic/registry.vim
759.107  000.009  000.009: sourcing /home/xavier/.vim/bundle/syntastic/plugin/syntastic/signs.vim
760.258  002.005  001.897: sourcing /home/xavier/.vim/bundle/syntastic/plugin/syntastic.vim
760.739  000.381  000.381: sourcing /home/xavier/.vim/bundle/tabular/plugin/Tabular.vim
761.175  000.354  000.354: sourcing /home/xavier/.vim/bundle/tagbar/plugin/tagbar.vim
761.604  000.348  000.348: sourcing /home/xavier/.vim/bundle/tasklist/plugin/tasklist.vim
762.095  000.413  000.413: sourcing /home/xavier/.vim/bundle/template/plugin/templates.vim
763.266  001.093  001.093: sourcing /home/xavier/.vim/bundle/tlib/plugin/02tlib.vim
766.875  003.518  003.518: sourcing /home/xavier/.vim/bundle/unimpaired/plugin/unimpaired.vim
772.055  005.058  005.058: sourcing /home/xavier/.vim/bundle/yankring/plugin/yankring.vim
772.575  000.425  000.425: sourcing /home/xavier/.vim/bundle/youcompleteme/plugin/youcompleteme.vim
772.706  000.045  000.045: sourcing /home/xavier/.vim/bundle/zoomwin/plugin/youcompleteme.vim
773.031  000.114  000.114: sourcing /usr/share/vim/vim73/plugin/getscriptPlugin.vim
773.339  000.278  000.278: sourcing /usr/share/vim/vim73/plugin/gzip.vim
773.592  000.224  000.224: sourcing /usr/share/vim/vim73/plugin/matchparen.vim
774.298  000.676  000.676: sourcing /usr/share/vim/vim73/plugin/netrwPlugin.vim
774.403  000.071  000.071: sourcing /usr/share/vim/vim73/plugin/rrhelper.vim
774.473  000.042  000.042: sourcing /usr/share/vim/vim73/plugin/spellfile.vim
774.736  000.236  000.236: sourcing /usr/share/vim/vim73/plugin/tarPlugin.vim
774.886  000.120  000.120: sourcing /usr/share/vim/vim73/plugin/tohtml.vim
775.142  000.228  000.228: sourcing /usr/share/vim/vim73/plugin/vimballPlugin.vim
775.365  000.191  000.191: sourcing /usr/share/vim/vim73/plugin/zipPlugin.vim
776.255  000.389  000.389: sourcing /home/xavier/.vim/bundle/tabular/autoload/tabular.vim
778.758  003.256  002.867: sourcing /home/xavier/.vim/bundle/tabular/after/plugin/TabularMaps.vim
778.803  007.133: loading plugins
779.811  001.008: inits 3
782.292  002.481: reading viminfo
786.146  003.854: setup clipboard
786.189  000.043: setting raw mode
786.191  000.002: start termcap
786.229  000.038: clearing screen
787.961  001.732: opening buffers
798.233  000.308  000.308: sourcing /home/xavier/.vim/bundle/syntastic/autoload/syntastic/util.vim
798.342  010.073: BufEnter autocommands
798.348  000.006: editing files in windows
798.610  000.209  000.209: sourcing /home/xavier/.vim/plugin/settings/solarized.vim
878.138  002.222  002.222: sourcing /home/xavier/.vim/bundle/youcompleteme/autoload/youcompleteme.vim
917.297  116.518: VimEnter autocommands
917.301  000.004: before starting main loop
931.751  014.450: first screen update
931.755  000.004: --- VIM STARTED ---
