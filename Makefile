#
# Makefile
# xavier, 2013-07-30 07:56
#
# vim:ft=make
#

#TODO Install accordingly to this variable
PROVIDER?=ansible
LOGS?=/tmp/dna.logs
TARGET_HOSTS?=localhost
USERNAME?=${USER}

all: install

install: dependencies ansible
	@echo "Installation is done."
	@echo "If docker is not installed on your system and you want to experiment the sandbox mode, head up to https://www.docker.io/gettingstarted/"

salt:
	@echo "Install salt master"
	curl -L http://bootstrap.saltstack.org | sudo sh -s -- -M -N
	@echo "Install salt minion"
	wget -O - http://bootstrap.saltstack.org | sudo sh
	@echo "Autorizing current machine"
	salt-key -A
	@echo "Installing minions"
	test -d /srv/salt || mkdir /srv/salt
	cp -r shell /srv/salt

ansible:
	apt-get install -y python-pip python-dev git-core
	@echo "[make] Install ansible, configuration manager"
	pip install PyYAML Jinja2 paramiko 2>&1 >> ${LOGS}
	test -d /opt/ansible || git clone git://github.com/ansible/ansible.git /opt/ansible

	@echo "!! Now: $ source /opt/ansible/hacking/env-setup"
	@echo "!! Now: $ edit ./provision/ansible/data.yml"

up:
	. /opt/ansible/hacking/env-setup 
	#DNA_ROOT=$(find / -name "dna")
	DNA_ROOT=${locate -b -l 1 -r \"^dna$\"}
	#TODO Use synthetize.sh
	ansible-playbook --verbose ./provision/ansible/site.yml --ask-sudo-pass -u ${USERNAME} --extra-vars="hosts=${TARGET_HOSTS} data=data.yml dna_root=${DNA_ROOT}" -i ./provision/ansible/hosts

install-dev:
	pip install -U ansible-shell

	#test ! -d /tmp/vagrant || rm -r /tmp/vagrant
	#git clone https://github.com/mitchellh/vagrant.git /tmp/vagrant
	#cd /tmp/vagrant && bundle install && rake install
	#@echo "You also need virtualbox (sudo apt-get install virtualbox)"

dependencies:
	@echo "[make] Update cache and install packages..."
	apt-get update 2>&1 >> ${LOGS}

	test -f optparse.bash || curl -o optparse.bash https://raw.github.com/nk412/optparse/master/optparse.bash

prototype:
	./synthetize -a prototype --user prototype --image hivetech/prototype --check --verbose

.PHONY: dependencies install
