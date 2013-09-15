#
# Copyright 2013 Xavier Bruhiere
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.


# ------------------------------------------------------------ Constants
# Assumptions (born to be tuned):
#    - Your IT projects are in $HOME/dev/projects
#    - Other open-source projects are in $HOME/openlibs
#    - You use node version 0.10.7
export PROJECTS=$HOME/dev/projects
export OPENLIBS=/opt
export NODE_VERSION="0.10.7"

TIME=`date +"%T"`

# Registering useful paths
# Customize to your needs...
export CDPATH=.:~:$HOME/dev/projects
export LD_LIBRARY_PATH=/usr/local/lib
export PKG_CONFIG_PATH=/usr/local/lib/pkgconfig 
#export TERM="xterm-256color"

test -d $HOME/local/bin && PATH="$HOME/local/bin:$PATH"
test -d $HOME/local/lib && PATH="$HOME/local/lib:$PATH"

# Go configuration
export GOROOT=/opt/go
export GOOS=linux
export GOARCH=amd64
#export GOBIN=$GOROOT/bin
export GOPATH=$HOME/dev/goworkspace
export PATH=$PATH:/opt/go/bin:$GOPATH/bin

export EDITOR=vim

# ------------------------------------------------------------- Functions
# Useful personal function, a little combinaison of two other one
function mkdircd () { mkdir -p "$@" && eval cd "\"\$$#\""; }
function up()
{
    LIMIT=$1
    P=$PWD
    for ((i=1; i <= LIMIT; i++))
    do
        P=$P/..
    done
    cd $P
    export MPWD=$P
}

function back()
{
    LIMIT=$1
    P=$MPWD
    for ((i=1; i <= LIMIT; i++))
    do
        P=${P%/..}
    done
    cd $P
    export MPWD=$P
}

#TODO Should it be replaced by https://github.com/simonwhitaker/gitignore-boilerplates ?
# Command line access to http://gitignore.io/, powered by https://github.com/github/gitignore
function gi() { curl http://gitignore.io/api/$@ ;}

# ------------------------------------------------------------- Plugins
# Node version management
#[[ -s $HOME/.nvm/nvm.sh ]] && . $HOME/.nvm/nvm.sh  # This loads NVM
if [[ -s $HOME/.nvm/nvm.sh ]]; then
    . $HOME/.nvm/nvm.sh  # This loads NVM
    nvm use v$NODE_VERSION
    [[ -r $NVM_DIR/bash_completion ]] && . $NVM_DIR/bash_completion
    export NODE_PATH=$HOME/.nvm/v$NODE_VERSION/lib/node_modules
    export NODE_ENV=development
fi

# Python virtualenv made easy
test -f /usr/local/bin/virtualenvwrapper.sh && source /usr/local/bin/virtualenvwrapper.sh && export WORKON_HOME=$HOME/.virtualenvs

# z is the new j, yo (https://github.com/rupa/z.git)
test -d $OPENLIBS/z && source $OPENLIBS/z/z.sh

# Adds numbered shortcuts to the output git status, and much more (https://github.com/ndbroadbent/scm_breeze.git)
[ -s "$HOME/.scm_breeze/scm_breeze.sh" ] && source "$HOME/.scm_breeze/scm_breeze.sh"

# script for automatic environment
test -d $OPENLIBS/autoenv && source $OPENLIBS/autoenv/activate.sh

### Added by the Heroku Toolbelt
test -d /usr/local/heroku && export PATH="/usr/local/heroku/bin:$PATH"

# A full-featured & carefully designed adaptive prompt for Bash & Zsh
test -d $OPENLIBS/liquidprompt && source $OPENLIBS/liquidprompt/liquidprompt

# A BASH wrapper for getopts, for simple command line arguments
test -d $OPENLIBS/optparse && source $OPENLIBS/optparse/optparse.bash
