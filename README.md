<p align="center">
  <img src="https://raw.github.com/hivetech/hivetech.github.io/master/images/logo-unide.png" alt="Unide logo"/>
</p>

DNA
====

> Hacking environment genetics


DNA is a community-driven compilation of dotfiles and projects, aimed
at creating the most awesome and powerful development environment.

Installation is performed through famous configuration managers like ansible
and [salt](http://saltstack.com/community.html) (currently focused on [ansible](www.ansibleworks.com)) as they obviously play nicely with a
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

    * Oh-my-zsh - [A community-driven framework for managing your zsh configuration](https://github.com/robbyrussell/oh-my-zsh)
    * Liquidprompt - [A full-featured & carefully designed adaptive prompt for Bash & Zsh](https://github.com/nojhan/liquidprompt)
    * Gitignore.io - [Generate useful .gitignore files for your project](https://github.com/joeblau/gitignore.io)
    * An easy way to extend the configuration with hooks shell/customrc.sh and shell/custom-alias.sh
    * carefully designed \*rc files, screen and tmux configuration

* Git

    * Git flow - [Git extensions to provide high-level repository operations for Vincent Driessen's branching model](https://github.com/nvie/gitflow)
    * Git-extras - [GIT utilities -- repo summary, repl, changelog population, author commit percentages and more](https://github.com/visionmedia/git-extras)
    * Scm breeze - [Adds numbered shortcuts to the output git status, and much more](https://github.com/ndbroadbent/scm_breeze)

* Dev

    * Optparse - [A BASH wrapper for getopts, for simple command line arguments](https://github.com/nk412/optparse)
    * Autopep8 - [A tool that automatically formats Python code to conform to the PEP 8 style guide](https://github.com/hhatto/autopep8)

* [Vim](https://github.com/hivetech/dna/blob/develop/vim/doc.markdown#plugins)

* Plugins

    * z - [z is the new j, yo](https://github.com/rupa/z)
    * t - [A command-line todo list manager for people that want to finish tasks, not organize them](http://stevelosh.com/projects/t/)
    * bd - [Quickly go back to a parent directory in linux](https://github.com/vigneshwaranr/bd)
    * nvm - [Node Version Manager - Simple bash script to manage multiple active node.js versions](https://github.com/creationix/nvm)

Usage (ansible style)
-----

```console
$ export DNA_PATH=where/you/want/dna  # Optional, default will be /opt/dna
$ export EDITOR=nano                  # Optional, default will be vim

$ wget -qO- https://raw.github.com/hivetech/dna/master/bootstrap.sh | bash

$ cd $DNA_PATH && rake -T
$ rake dna:synthetize               # Default will setup your local machine

$ # Once installed
$ dna-help -h
$ dna-help --all
```

Sandbox mode (still ansible style)
------------

You can use test project in a virtualize environment. Typical use case would be
to enjoy a clean dev env while working in docker powered machines, or test your
awesome fork.

```console
$ ./synthetize --help
$ ./synthetize --action prototype --check --verbose   # Changes won't be applied, just tested
$ ./synthetize --action target --port 49500 --image hivetech/prototype --user you
$ ./synthetize connect  # Password is proto (set in dockerfile)
```

(**Experimental**) A Vagrantfile is provided and you can check out the [documentation](http://docs.vagrantup.com/v2/provisioning/ansible.html)
for more informations. Make sure `dna/provision/ansible/data.yml` suits
you and a vagrant section is present in `dna/provision/ansible/hosts`.

You also have to modified `hosts` variable in site.yml to `vagrant` because of a weird vagrantfile bug.

Then just run `vagrant up && vagrant ssh`.


Versioning Semantics
--------------------

For transparency and insight into our release cycle, and for striving to
maintain backward compatibility, Ghost will be maintained according to the
[Semantic Versioning](http://semver.org/) guidelines as much as possible.

Releases will be numbered with the following format:

`<major>.<minor>.<patch>-<build>`

Constructed with the following guidelines:

* A new *major* release indicates a large change where backwards compatibility is broken.
* A new *minor* release indicates a normal change that maintains backwards compatibility.
* A new *patch* release indicates a bugfix or small change which does not affect compatibility.
* A new *build* release indicates this is a pre-release of the version.


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

Kudos
-----

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

* [Vim kudos](https://github.com/hivetech/dna/blob/develop/vim/doc.markdown#kudos)
