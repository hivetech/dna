#! /usr/bin/env python
# -*- coding: utf-8 -*-
# vim:fenc=utf-8

'''
  errors
  ------

  :copyright (c) 2014 Hive Tech, SAS.
  :license: Apache 2.0, see LICENSE for more details.
'''

import logging


class FactoryError(Exception):
    ''' Factory class for exceptions '''
    msg = None
    log = None

    def __init__(self, *args, **kwargs):
        self.args = args
        self.kwargs = kwargs
        self.message = str(self)
        if kwargs.get('log', True):
            self.log = logging.logger(__name__)

    def __str__(self):
        msg = self.msg.format(**self.kwargs)
        if self.log:
            self.log.error(msg, exception=self.__class__.__name__)
        return msg

    __unicode__ = __str__
    __repr__ = __str__


class DynamicImportFailed(FactoryError):
    msg = "unable to import {module}: {reason}"
