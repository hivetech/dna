# -*- coding: utf-8 -*-
# vim:fenc=utf-8

'''
  :copyright (c) 2014 Xavier Bruhiere.
  :license: MIT, see LICENSE for more details.
'''


import datetime as dt
import flask.ext.mongoengine as mongo


class User(mongo.Document):

    created_at = mongo.mongoengine.DateTimeField(default=dt.datetime.now)
    username = mongo.mongoengine.StringField(
        max_length=255, required=True, unique=True)
    password = mongo.mongoengine.StringField(max_length=255, default='...')
    api_key = mongo.mongoengine.StringField(
        max_length=255, required=True, unique=True)

    meta = {
        'allow_inheritance': True,
        'indexes': ['-created_at', 'username'],
        'ordering': ['-created_at']
    }

    def __repr__(self):
        return '<User %r>' % (self.username)
