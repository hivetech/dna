# = DNA Rake - Community-driven dotfiles that will sharpen your system
#
# Author::    Xavier Bruhiere
# Copyright:: (c) 2013, Xavier Bruhiere
# License::   Apache 2.0
#
# Feedback appreciated: xavier.bruhiere@gmail.com

# https://github.com/michaeldv/awesome_print
require "awesome_print"

logs = "/tmp/dna.rake"

task :default => [:install]

desc "Install dna"
task :install => [ "install:deps",  "install:ansible", "install:extras"]

namespace :install do
    desc "Install app dependencies"
    task :deps do
        msg "update cache"
        sh "apt-get update 2>&1 >> #{logs}"
        msg "install optparse (https://github.com/nk412/optparse)"
        cmd = "test -f optparse.bash || curl -o optparse.bash https://raw.github.com/nk412/optparse/master/optparse.bash"
        result = system(cmd)
        raise("optparse installation failed..  msg: #{$?}") unless result
    end

    desc "Install ansible, configuration manager"
    task :ansible do
        msg "install ansible dependencies"
        sh "apt-get install -y python-pip python-dev git-core 2>&1 #{logs}"
        msg "install ansible, configuration manager"
        sh "pip install PyYAML Jinja2 paramiko 2>&1 >> #{logs}"
        sh "test -d /opt/ansible || git clone git://github.com/ansible/ansible.git /opt/ansible"

        msg "!! now: $ source /opt/ansible/hacking/env-setup"
        msg "!! now: $ edit ./provision/ansible/data.yml"

        msg "Installation is done."
        msg "If docker is not installed on your system and you want to experiment the sandbox mode, head up to https://www.docker.io/gettingstarted/"
    end

    task :salt do
        msg "Install salt"
        msg "Install salt master"
        sh "curl -L http://bootstrap.saltstack.org | sudo sh -s -- -M -N"
        msg "Install salt minion"
        sh "wget -O - http://bootstrap.saltstack.org | sudo sh"
        msg "Autorizing current machine"
        sh "salt-key -A"
        msg "Installing minions"
        sh "test -d /srv/salt || mkdir /srv/salt"
        sh "cp -r shell /srv/salt"
    end

    desc "Install dev extra dependencies"
    task :extras do
        msg "Install dev extra deps"
	    sh "pip install --upgrade ansible-shell 2>&1 >> #{logs}"
    end
end

namespace :dna do
    desc "Synthetize dna on your specified hosts"
    task :synthetize do
        msg "Synthetize dna"
        msg "Make sure you edited data.yml and hosts files"
        #TODO Get user entry
        #FIXME get  user
	    sh ". /opt/ansible/hacking/env-setup"
        user = "unknown"
	    sh "./synthetize -a target --user #{user} --image hivetech/prototype --verbose"
    end

    desc "Check your dna on a bench docker-powered machine"
    task :prototype do
        msg "Test dna on docker machines"
        sh "./synthetize -a prototype --user prototype --image hivetech/prototype --verbose --check"
    end
end

private

def msg(text)
    ap "-- rake: #{text}"
end
