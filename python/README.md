python library DNA
==================

[![Coverage Status](https://coveralls.io/repos/hivetech/dna/badge.png)](https://coveralls.io/r/hivetech/dna)

> Generic python utilities

Installation
------------

```console
pip install dna
```

Example
-----

```python
import dna.utils as utils
import dna.logger as logger

log_setup = logger.setup(level='info', filename='app.log')
log = logger.logger(__name__)
with log_setup.applicationbound():

    log.info('hello', where='world')

    useless_id = utils.generate_unique_id()
    useless_name = utils.generate_random_name()

    if utils.docker_check() and utils.is_running('ipyhon'):

        print utils.Version('0.4.1')

        module = utils.dynamic_import('dna.settings', 'LOG')
        print utils.emphasis(module, align=False)

        print utils.self_ip()
```
