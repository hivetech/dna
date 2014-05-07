# -*- coding: utf-8 -*-
# vim:fenc=utf-8

'''
  RESTful authentification methods
  --------------------------------

  :copyright (c) 2014 Xavier Bruhiere.
  :license: MIT, see LICENSE for more details.
'''

import flask
import flask.ext.restful
import functools
import dna.logging
import dna.apy.models as models

log = dna.logging.logger(__name__)


def check_credentials(username, password):
    ''' Verify basic http authentification '''
    user = models.User.objects(
        username=username,
        password=password
    ).first()
    return user or None


def check_token(token):
    ''' Verify http header token authentification '''
    user = models.User.objects(api_key=token).first()
    return user or None


def auth_failed():
    ''' Sends a 401 response '''
    return flask.Response(
        '{"error": "Could not verify your access level for that URL. '
        'You have to login with proper credentials"}', 401,
        {'WWW-Authenticate': 'Token realm="Login Required"'})


def requires_basic_auth(resource):
    '''
    Flask decorator protecting ressources using username/password scheme
    '''
    @functools.wraps(resource)
    def decorated(*args, **kwargs):
        ''' Check provided username/password '''
        auth = flask.request.authorization
        user = check_credentials(auth.username, auth.password)

        if not auth or user is None:
            log.warn('authentification failed', credentials=auth)
            return auth_failed()

        log.info('authentification succeeded', credentials=auth)
        flask.g.user = user
        return resource(*args, **kwargs)
    return decorated


def requires_token_auth(resource):
    '''
    Flask decorator protecting ressources using token scheme
    '''
    @functools.wraps(resource)
    def decorated(*args, **kwargs):
        ''' Check provided token '''
        token = flask.request.headers.get('Authorization')
        user = check_token(token)

        if not token or user is None:
            log.warn('authentification failed', token=token)
            return auth_failed()

        flask.g.user = user
        log.info('authentification succeeded', token=token, user=flask.g.user)
        return resource(*args, **kwargs)
    return decorated
