Hivetech Utils Scripts
========================

Various scripts to rigorously cultivate our lazyness.

golab
-----

Start and ssh you into a docker container powered by `dna`, as prototype user.
His (tough) password is proto for sudo and ssh.


task-check
----------

Report pending tasks in your project.

```console
$ tash-check <pattern=TODO> <location=.>
```


openlibs-update
---------------

Update git-backed projects in {{ openlibs }}.


apt-git
-------

One liner style for installation (with some options, only the first one is
required):

```console
$ export PROJECT_URL=hivetech/dna
$ export INSTALL_PATH=/some/where
$ export MAKE_TARGET=all
$ export VIRTUALIZE=false
$ export PROVIDER=lxc
```

And shoot:

```
$ wget -qO- https://raw.github.com/hivetech/dna/blob/develop/utils/apt-git | bash
```

view-doc
--------

Browse beautiful project documentation.

* Default uses DocumentUp.com to expose your ReadMe, if you host the code on github
* Otherwise look for a doc directory powered by daux.io
