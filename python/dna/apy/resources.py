#! /usr/bin/env python
# -*- coding: utf-8 -*-
# vim:fenc=utf-8

'''
  :copyright (c) 2014 Xavier Bruhiere.
  :license: %LICENCE%, see LICENSE for more details.
'''

import flask
from flask.ext import restful
import dna.apy.models as models
import dna.apy.auth as auth


class SecuredRestfulResource(restful.Resource):
    '''
    Set per default Flask-Login resource protection
    '''
    method_decorators = [auth.requires_token_auth]


class TestRestricted(SecuredRestfulResource):
    ''' Implement a useless protected endpoint for test purpose '''

    def get(self):
        return {
            'hello': str(flask.g.user),
            'username': flask.g.user.username,
            'password': flask.g.user.password,
            'api_key': flask.g.user.api_key,
            'created': str(flask.g.user.created_at)
        }


class User(restful.Resource):
    ''' Register new users and inspect them '''

    def get(self, username):
        user = models.User.objects(username=username)
        print user
        if len(user) == 0:
            flask.abort(404)
        return {username: str(user)}

    def put(self, username):
        user = models.User()
        user.username = username
        # TODO unique_id = generate(username, password)
        user.api_key = 'd2a879423e53ddbb6788bbc286647a793440f3db'
        user.save()
        return {'saved': True}
