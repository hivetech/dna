#TODO: Are test command available here ?
# https://github.com/vigneshwaranr/bd
alias bd=". bd -s"

alias cleanlatex='rm *.aux *.log *.toc *.lof *.out'

# Todo utilities
alias t='python $OPENLIBS/t/t.py --task-dir $HOME/.tasks --list tasks'

alias vvim='screen vim'

alias cheatsheet="less $HOME/dev/projects/Pergame/linuxgems/cheat_sheet.org.sh"

alias processing="$OPENLIBS/processing-2.0/processing"

alias veewee='bundle exec veewee'

# --------

#Quantrade
alias trade='$QTRADE/scripts/run_app.sh'
alias tredit='vim $QTRADE/scripts/run_app.sh'
alias dbtrade='mysql stock_data -p'
#alias golab='cd $QTRADE && workon neuronquant'

alias gojudo="cd $GOPATH/src/github.com/hivetech/judo"
alias gocore="cd $GOPATH/src/launchpad.net/juju-core"
alias sjuju="sudo $GOPATH/bin/juju -v"

# https://github.com/benweet/stackedit
alias stackedit="chromium-browser --disable-application-cache http://localhost/stackedit/\?debug"
