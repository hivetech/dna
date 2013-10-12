<p align="center">
  <img src="https://raw.github.com/hivetech/hivetech.github.io/master/images/logo-unide.png" alt="Unide logo"/>
</p>

DNA
====

> Hacking environment genetics


DNA is a community-driven compilation of dotfiles and projects, aimed
at creating the most awesome and powerful development environment.

Installation is performed through famous configuration managers like ansible
and [salt](http://saltstack.com/community.html) (currently focus on [ansible](www.ansibleworks.com)) as they obviously play nicely with a
dotfiles repository and allow you to configure in seconds thousands of machines,
as well as simply your beloved local one.  

It is designed to be plugin-friendly: A new awesome, github featured
project you discovered for your environment ? Star it and just plug
a playbook ( / minion / recipe / manifest / script) in the plugin directory.


Content
-------

This is heavy work in progress. Right now we are cleaning and moving here our
previous repo (https://github.com/hackliff/Dotfiles)

* Shell

    * [A community-driven framework for managing your zsh configuration](https://github.com/robbyrussell/oh-my-zsh)
    * [A full-featured & carefully designed adaptive prompt for Bash & Zsh](https://github.com/nojhan/liquidprompt)
    * [Generate useful .gitignore files for your project](https://github.com/joeblau/gitignore.io)
    * An easy way to extend the configuration with hooks shell/customrc.sh and shell/custom-alias.sh
    * carefully designed \*rc files, screen and tmux configuration

* Git

    * [Git extensions to provide high-level repository operations for Vincent Driessen's branching model](https://github.com/nvie/gitflow)
    * [GIT utilities -- repo summary, repl, changelog population, author commit percentages and more](https://github.com/visionmedia/git-extras)
    * [Adds numbered shortcuts to the output git status, and much more](https://github.com/ndbroadbent/scm_breeze)

* Dev

    * [A BASH wrapper for getopts, for simple command line arguments](https://github.com/nk412/optparse)
    * [A tool that automatically formats Python code to conform to the PEP 8 style guide](https://github.com/hhatto/autopep8)
    * [Node Version Manager - Simple bash script to manage multiple active node.js versions](https://github.com/creationix/nvm)

* Vim

    * [Vundle, the plug-in manager for Vim](https://github.com/gmarik/vundle)
    * [a Git wrapper so awesome, it should be illegal ](https://github.com/tpope/vim-fugitive)
    * [Syntax checking hacks for vim](https://github.com/scrooloose/syntastic)
    * [Precision colorscheme for the vim text editor](https://github.com/altercation/vim-colors-solarized)
    * [Vim plugin, provides insert mode auto-completion for quotes, parens, brackets, etc](https://github.com/Raimondi/delimitMate)
    * [Fuzzy file, buffer, mru, tag, etc finder](https://github.com/kien/ctrlp.vim)

* Plugins

    * [z is the new j, yo](https://github.com/rupa/z)
    * [A command-line todo list manager for people that want to finish tasks, not organize them](http://stevelosh.com/projects/t/)
    * [Quickly go back to a parent directory in linux](https://github.com/vigneshwaranr/bd)

Usage (ansible style)
-----

```bash
$ git clone https://github.com/hivetech/dna.git /opt/dna
$ cd /opt/dna && sudo make install
$ $EDITOR /opt/dna/provision/ansible/data.yml   # Configuration
$ $EDITOR /opt/dna/provision/ansible/hosts      # Where to deploy
$ make up  # Default will setup your machine
```

Sandbox mode (still ansible style)
------------

You can use this project in a virtualize environment. Typical use case would be
to enjoy a clean dev env while working in docker powered machines, or test your
awesome fork.

```console
$ ./prototype.sh --help
$ ./prototype.sh --action test --port 49500 --verbose
$ ssh root@127.0.0.1 -p 49500  # Password is proto (set in dockerfile)
```

(**Experimental**) A Vagrantfile is provided and you can check out the [documentation](http://docs.vagrantup.com/v2/provisioning/ansible.html)
for more informations. Make sure `dna/provision/ansible/vagrant-data.yml` suits
you and a vagrant section is present in `dna/provision/ansible/hosts`.

You also have to modified `hosts` variable in site.yml because of a weird vagrantfile bug.

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

Commit messages convention
--------------------------

From now on git commit messages will follow this [Angular wise document](https://docs.google.com/document/d/1QrDFcIiPjSLDn3EL15IJygNPiHORgU1_OOAqWjiDU5Y/edit#).
To sum up :

```
{{ type }} ({{ scope }}): {{ subject }}

{{ body }}

{{ footer }}
```

Where type = { feat | fix | doc | style | refactor | test | chore }

License
-------

DNA is available under the [Apache License, Version 2.0](http://www.apache.org/licenses/LICENSE-2.0.html).

Super Credits
-------------

* [nvie](https://github.com/nvie)
* [visionmedia](https://github.com/visionmedia)
* [robbyrussel](https://github.com/robbyrussell)
* [square](https://github.com/square)
* [nojhan](https://github.com/nojhan)
* [github](https://github.com/github)
* [joeblau](https://github.com/joeblau)
* [sjl](https://github.com/sjl)
* [rupa](https://github.com/rupa)
* [vigneshwaranr](https://github.com/vigneshwaranr)
* [nk412](https://github.com/nk412)
* [hhatto](https://github.com/hhatto)
* [ndbroadbent](https://github.com/ndbroadbent)
* [creationix](https://github.com/creationix)
* [gmarik](https://github.com/gmarik)
* [tpope](https://github.com/tpope/vim-fugitive)
