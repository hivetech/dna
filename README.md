Level up your dev environment
=============================

This project is a community-driven compilation of dotfiles and projects, aimed
at creating the most awesome and powerful development environment.

The installation is performed through famous configuration manager like ansible
and [salt](http://saltstack.com/community.html) (currently focus on [ansible](www.ansibleworks.com)) as they obviously play nicely with a
dotfiles repository and allow you to configure in seconds thousands of machines,
as well as simply your beloved local one.  

It is designed to be plugin-friendly: A new awesome, github featured
project you discovered for your environment ? Clone it (star it) and just plug
a playbook ( / minion / recipe / manifest / script).


Content
-------

This is heavy work in progress. Right now we are cleaning and moving here our
previous repo (https://github.com/hackliff/Dotfiles)

* Shell

    * [A community-driven framework for managing your zsh configuration](https://github.com/robbyrussell/oh-my-zsh)
    * [A full-featured & carefully designed adaptive prompt for Bash & Zsh](https://github.com/nojhan/liquidprompt)
    * [Generate useful .gitignore files for your project](https://github.com/joeblau/gitignore.io)
    * An easy way to extend the configuration with hooks shell/customrc.sh and shell/custom-alias.sh
    * Various cool stuff in rc files

Usage (ansible style)
-----

Since the makefile isn't ready yet, follow [those
instructions](http://www.ansibleworks.com/docs/gettingstarted.html) to install
ansible. Then:

```bash
$ git clone https://github.com/hivetech/dna.git /opt/dna
$ $EDITOR /opt/dna/provision/ansible/data.yml   # Configuration
$ $EDITOR /opt/dna/provision/ansible/hosts      # Where to deploy
$ ansible-playbook /opt/dna/provision/ansible/shell.yml \
    --ask-pass -u $USER \
    --extra-vars="data=/opt/dna/provision/ansible/data.yml" \
    -i /opt/dna/provision/ansible/hosts
```


Sandbox mode (still ansible style)
------------

You can use this project with vagrant. Typical use case would be to enjoy a
clean dev env while working in vagrant powered machines, or test your awesome fork.

A Vagrantfile ready-to-use is provided and you can check out the [documentation](http://docs.vagrantup.com/v2/provisioning/ansible.html)
for more informations. Make sure `dna/provision/ansible/vagrant-data.yml` suits
you and a vagrant section is present in `dna/provision/ansible/hosts`. 

Then just run `vagrant up && vagrant ssh`.


Versioning Semantics
--------------------

[From Carl Boettiger](http://carlboettiger.info/)

Releases will be numbered with the following semantic versioning format:

major.minor.patch

And constructed with the following guidelines:

* Breaking backward compatibility bumps the major (and resets the minor 
  and patch)
* New additions without breaking backward compatibility bumps the minor 
  (and resets the patch)
* Bug fixes and misc changes bumps the patch
