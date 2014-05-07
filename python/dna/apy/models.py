# -*- coding: utf-8 -*-
# vim:fenc=utf-8

'''
  :copyright (c) 2014 Xavier Bruhiere.
  :license: MIT, see LICENSE for more details.
'''


import datetime as dt
from dna.apy.core import Application


class User(Application.db.Document):

    created_at = Application.db.DateTimeField(default=dt.datetime.now)
    username = Application.db.StringField(
        max_length=255, required=True, unique=True)
    password = Application.db.StringField(max_length=255, default='whatever')
    api_key = Application.db.StringField(
        max_length=255, required=True, unique=True)

    meta = {
        'allow_inheritance': True,
        'indexes': ['-created_at', 'username'],
        'ordering': ['-created_at']
    }

    def __repr__(self):
        return '<User %r>' % (self.username)
