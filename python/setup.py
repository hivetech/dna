#!/usr/bin/env python
# -*- coding: utf-8 -*-
# vim:fenc=utf-8

'''
  Packaging
  ---------

  :copyright (c) 2014 Xavier Bruhiere
  :license: Apache 2.0, see LICENSE for more details.
'''

import multiprocessing
import setuptools
from dna import (
    __project__, __version__, __author__, __licence__, __description__
)


REQUIREMENTS = [
    'click',
    'sh',
    'python-dateutil',
    'raven',
    'Logbook',
    'structlog',
    'docker-py',
    'docopt',
    'celery',
    'redis',
    'Flask-RESTful',
    'flask-mongoengine'
]


def long_description():
    """ Safely provide to setup.py the project README.md. """
    try:
        with open('README.md') as readme_file:
            return readme_file.read()
    except IOError:
        return "failed to read README.md"


setuptools.setup(
    name=__project__,
    version=__version__,
    description=__description__,
    author=__author__,
    author_email='xavier.bruhiere@gmail.com',
    packages=setuptools.find_packages(),
    long_description=long_description(),
    license=__licence__,
    install_requires=REQUIREMENTS,
    url="https://github.com/hivetech/dna",
    classifiers=[
        'Development Status :: 2 - Pre-Alpha',
        'License :: OSI Approved :: Apache Software License',
        'Natural Language :: English',
        'Programming Language :: Python',
        'Programming Language :: Python :: 2.7',
        'Operating System :: OS Independent',
        'Intended Audience :: Science/Research',
        'Topic :: Software Development',
        'Topic :: System :: Shells'
    ]
)
