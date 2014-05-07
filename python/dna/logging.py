# -*- coding: utf-8 -*-
# vim:fenc=utf-8

'''
  logger configuration
  -------------------------

  :copyright (c) 2014 Hive Tech, SAS.
  :license: Apache 2.0, see LICENSE for more details.
'''

import sys
import calendar
import time
from structlog import wrap_logger
from structlog.processors import JSONRenderer
from raven.handlers.logbook import SentryHandler
import logbook
import dna.utils as utils
import dna.settings as settings


def add_unique_id(logger_class, log_method, event):
    ''' Attach a unique id per event '''
    event['id'] = utils.generate_unique_id()
    return event


def add_timestamp(logger_class, log_method, event_dict):
    ''' Attach the event time, as unix epoch '''
    event_dict['timestamp'] = calendar.timegm(time.gmtime())
    return event_dict


def setup(level='debug', show_log=False, filename=settings.LOG['file']):
    ''' Hivy formated logger '''

    level = level.upper()
    handlers = [
        logbook.NullHandler()
    ]
    if show_log:
        handlers.append(
            logbook.StreamHandler(sys.stdout,
                                  format_string=settings.LOG['format'],
                                  level=level))
    else:
        handlers.append(
            logbook.FileHandler(filename,
                                format_string=settings.LOG['format'],
                                level=level))

    sentry_dns = settings.LOG['sentry_dns']
    if sentry_dns:
        handlers.append(SentryHandler(sentry_dns, level='ERROR'))

    return logbook.NestedSetup(handlers)


def logger(name=__name__, uuid=False, timestamp=False):
    ''' Configure and return a new logger for hivy modules '''
    processors = [JSONRenderer()]
    if uuid:
        processors.append(add_unique_id)
    if uuid:
        processors.append(add_timestamp)
    return wrap_logger(
        logbook.Logger(name),
        processors=processors
    )
