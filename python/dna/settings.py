# -*- coding: utf-8 -*-
# vim:fenc=utf-8

'''
  hard coded settings
  -------------------

  :copyright (c) 2014 Hive Tech, SAS.
  :license: Apache 2.0, see LICENSE for more details.
'''

import os


LOG = {
    'sentry_dns': os.environ.get('SENTRY_DNS'),
    'file': '/tmp/app.log',
    'format': (u'[{record.time:%m-%d %H:%M}] '
               '{record.level_name} {record.channel} {record.message}')
}
