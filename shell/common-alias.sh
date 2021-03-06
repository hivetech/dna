# Push and pop directories on directory stack
alias pu='pushd'
alias po='popd'

# Basic directory operations
alias ...='cd ../..'
alias sw='cd -'

# Super user
alias _='sudo'
alias please='sudo'

# NOTE There might be a better way
alias igrep='grep -in'

# Show history
alias history='fc -l 1'

# List direcory contents
alias lsa='ls -lah'
alias l='ls -CF'
alias ll='ls -l'
alias la='ls -lA'
alias sl=ls  # often screw this up

alias afind='ack-grep -il'

# ----- Personal add
#alias gcc='colorgcc'
#alias make='colormake'

# Other
alias tarx='tar zxvf'

# Big one for mc
alias mc='mc --colors directory=brightblue,default:normal=lightgray,default:\
executable=brightgreen,default:selected=yellow,blue:\
marked=yellow,default:markselect=gray,blue:link=brightmagenta,default:\
stalelink=brightred,default:core=red,default:\
device=green,default:special=red,default:errors=white,red:\
reverse=yellow,red:gauge=red,blue:input=brightblue,black:\
dnormal=yellow,default:dfocus=yellow,blue:dhotnormal=yellow,blue:\
dhotfocus=yellow,red:menu=brightblue,default:\
menusel=yellow,red:menuhot=yellow,default:menuhotsel=yellow,red:\
helpnormal=blue,black:helpitalic=red,black:\
helpbold=yellow,black:helplink=black,blue:helpslink=yellow,blue:\
viewunderline=brightred,default:\
editnormal=lightgrey,default:editbold=yellow,default:\
editmarked=brightblue,default'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
#alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# automatic corr
alias corr='shopt -s cdspell'

# Docker
alias dps='docker ps'
alias dlast='docker ps -l -q'
#alias dcclean="docker ps -a -notrunc | grep 'Exit' | awk '{print $1}' | xargs -r docker rm"
alias dcclean='docker rm `docker ps -a -q`'
#alias diclean="docker images -notrunc| grep none | awk '{print $3}' | xargs -r docker rmi"
alias diclean="docker rmi $( sudo docker images | grep '<none>' | tr -s ' ' | cut -d ' ' -f 3)"
alias dclean='dcclean && diclean'

# Misc
alias starwars='telnet towel.blinkenlights.nl.'
alias clipboard='xclip -sel clip'
alias chx='chmod +x'

#TODO alias pair-code

# Python style directory creation
# FIXME alias mkdyr='mkdir $1 && touch $1/__init__.py'

# https://hub.github.com/
alias git=hub

# https://github.com/jonathanslenders/python-prompt-toolkiT
alias python='ptipython --vi'
