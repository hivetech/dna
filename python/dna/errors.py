#! /usr/bin/env python
# -*- coding: utf-8 -*-
# vim:fenc=utf-8

'''
  errors
  ------

  :copyright (c) 2014 Hive Tech, SAS.
  :license: Apache 2.0, see LICENSE for more details.
'''


class FactoryError(Exception):
    ''' Factory class for exceptions '''
    msg = None

    def __init__(self, *args, **kwargs):
        self.args = args
        self.kwargs = kwargs
        self.message = str(self)

    def __str__(self):
        msg = self.msg.format(**self.kwargs)
        return msg

    __unicode__ = __str__
    __repr__ = __str__


class ImportContextFailed(FactoryError):
    msg = "unable to import context builer from {module}: {reason}"
