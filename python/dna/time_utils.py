# -*- coding: utf-8 -*-
# vim:fenc=utf-8

'''
  :copyright (c) 2014 Hive Tech, SAS.
  :license: Apache 2.0, see LICENSE for more details.
'''

import pandas as pd
import time
import datetime as dt
import pytz
import calendar
import locale
import dateutil.parser


# TODO Handle in-day dates, with hours and minutes
def normalize_date_format(date):
    '''
    Dates can be defined in many ways, but zipline use
    aware datetime objects only. Plus, the software work
    with utc timezone so we convert it.
    '''
    if isinstance(date, int):
        # This is probably epoch time
        date = time.strftime('%Y-%m-%d %H:%M:%S',
                             time.localtime(date))

    # assert isinstance(date, str) or isinstance(date, unicode)
    if isinstance(date, str) or isinstance(date, unicode):
        date = dateutil.parser.parse(date)
    if not date.tzinfo:
        local_tz = pytz.timezone(_detect_timezone())
        local_dt = local_tz.localize(date, is_dst=None)
        # TODO I'm not sure why and when I need to add a date to make it right
        date = local_dt.astimezone(pytz.utc) + pd.datetools.day

    return date


def _detect_timezone():
    '''
    Get timezone as set by the system
    '''
    default_timezone = 'America/New_York'
    locale_code = locale.getdefaultlocale()
    return default_timezone if not locale_code[0] else \
        str(pytz.country_timezones[locale_code[0][-2:]][0])


def UTC_date_to_epoch(utc_date):
    return calendar.timegm(utc_date.timetuple())


def epoch_to_date(epoch, tz=pytz.utc):
    tm = time.gmtime(epoch)
    return(dt.datetime(tm.tm_year, tm.tm_mon, tm.tm_mday,
           tm.tm_hour, tm.tm_min, tm.tm_sec, 0, tz))
