#! /bin/bash
#
# bootstrap.sh
# Copyright (C) 2013 Xavier Bruhiere
#

export DNA_PATH=${DNA_PATH:-"/opt/dna"}

function install() {
    echo "install ruby dependencies"
    sudo apt-get install -y ruby1.9.3
    sudo gem install rake awesome_print

    echo "clone dna and install it"
    test -d $DNA_PATH || sudo git clone https://github.com/hivetech/dna.git $DNA_PATH
    cd $DNA_PATH && sudo rake install

    #echo "activate ansible"
    #. /opt/ansible/hacking/env-setup
}

echo "install dna..."
install

echo "! Edit your configuration in $DNA_PATH/provision/ansible/data.yml"
echo "! Edit targets to configure in $DNA_PATH/provision/ansible/hosts"
