# QuanTrade
export QTRADE=$HOME/dev/projects/ppQuanTrade
#export ZIPLINE=$QTRADE/zipline
export ZIPLINE=$HOME/openlibs/zipline
export GRYD=$HOME/dev/projects/labo
export PYTHONPATH=$PYTHONPATH:$QTRADE:$ZIPLINE:$GRYD
#FIXME Forcing node config dir here is too much intrusive
export NODE_CONFIG_DIR=$HOME/dev/projects/labo/config
export TASKS_PATH=$QTRADE/config/plugins.json

# QuantLab configuration
export SERVERDEV_IP=192.168.0.17
export SERVERDEPLOY_IP=192.168.0.17
export SERVERDEV_PORT=8080

# Juju Project configuration
export JUJU_PATH=$GOPATH/src/launchpad.net/juju-core
export JUDO_PATH=$GOPATH/src/github.com/hivetech/judo
export ANSIBLE_HOSTS=/etc/ansible/hosts
