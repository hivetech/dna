#
# Makefile
# xavier, 2013-07-30 07:56
#
# vim:ft=make
#

LOGS?=/tmp/dna.logs
#TODO Install accordingly to this variable
PROVIDER?=ansible
TARGET_HOSTS?=localhost

all: dependencies install

install: dependencies ansible
	@echo "Installation is done."

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
	apt-get install python-pip python-dev git-core
	@echo "[make] Install ansible, configuration manager"
	pip install PyYAML Jinja2 paramiko 2>&1 >> ${LOGS}
	test -d /opt/ansible || git clone git://github.com/ansible/ansible.git /opt/ansible

	@echo "!! Now: $ source /opt/ansible/hacking/env-setup"
	@echo "!! Now: $ edit ./provision/ansible/data.yml"

up:
	ansible-playbook --verbose ./provision/ansible/site.yml --ask-sudo-pass -u ${USER} --extra-vars="hosts=${TARGET_HOSTS} data=data.yml user=${USER}" -i ./provision/ansible/hosts

dependencies:
	@echo "[make] Update cache and install packages..."
	apt-get update 2>&1 >> ${LOGS}

tests:
	@echo "Coming soon"

.PHONY: dependencies install tests
