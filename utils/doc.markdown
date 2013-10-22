Hivetech Utils Scripts
========================

Various scripts to rigorously cultivate our lazyness.

dna-help
--------

Helper for `dna` users. It keeps track of what `dna` synthetized here.

```console
$ dna-help --help
$ dna-help --all
$ dna-help <plugin>
```


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

Note this command is aliased as golab with `dna`.
