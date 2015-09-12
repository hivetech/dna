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

function extract {
  echo Extracting $1 ...
  if [ -f $1 ] ; then
      case $1 in
          *.tar.bz2)   tar xjf $1  ;;
          *.tar.gz)    tar xzf $1  ;;
          *.bz2)       bunzip2 $1  ;;
          *.rar)       unrar x $1    ;;
          *.gz)        gunzip $1   ;;
          *.tar)       tar xf $1   ;;
          *.tbz2)      tar xjf $1  ;;
          *.tgz)       tar xzf $1  ;;
          *.zip)       unzip $1   ;;
          *.Z)         uncompress $1  ;;
          *.7z)        7z x $1  ;;
          *)        echo "'$1' cannot be extracted via extract()" ;;
      esac
  else
      echo "'$1' is not a valid file"
  fi
}

function public-ip() {
  # Other services
  #http://curlmyip.com
  #http://ipaddr.me
  #http://www.icanhazip.com
  echo "$(wget -qO- http://jsonip.com | cut -d"\"" -f4)"
}

function search() {
  grep -RnsI --color=auto $1
}

function dip() {
  container_id=$1
  [ -n "$1" ] || container_id=`dlast`
  docker inspect -f '{{ .NetworkSettings.IPAddress }}' $container_id
}

function dreduce() {
  CONTAINER_ID=$1
  IMAGE_NAME=$2
  docker export $CONTAINER_ID | docker import - $IMAGE_NAME
}
