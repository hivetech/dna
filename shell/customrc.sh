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
