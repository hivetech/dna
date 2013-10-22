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
task :install => [ "install:deps",  "install:ansible"]

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
        sh "apt-get install -y python-pip python-dev git-core 2>&1 >> #{logs}"
        msg "install ansible, configuration manager"
        sh "pip install --upgrade ansible==1.3.3 2>&1 >> #{logs}"

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
    desc "Synthetize dna on your specified hosts, for the given user [default: local username]"
    task :synthetize, :user do |t, args|
        args.with_defaults(:user => ENV['USER'])
        msg "Synthetize dna on host for user #{args[:user]}."
        msg "Make sure you edited data.yml and hosts files"
        sh "./synthetize -a target --user #{args[:user]} --image hivetech/lab --verbose"
    end

    desc "Check your dna on a bench docker-powered machine, --check will disable changes"
    task :prototype, :check do |t, args|
        args.with_defaults(:check => '')
        msg "Test dna on docker machines"
        if args[:check] == "--check"
            msg "check mode, changes won't be applied"
        end
        sh "./synthetize -a prototype --user prototype --image hivetech/lab --verbose #{args[:check]}"
    end

    desc "Connect through ssh to the prototype"
    task :explore do
        msg "connecting to the prototype"
        sh './synthetize -a explore --verbose'
        msg 'disconnected'
    end
end

private

def msg(text)
    ap "  => rake: #{text}"
end
