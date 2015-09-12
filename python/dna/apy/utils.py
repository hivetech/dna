# -*- coding: utf-8 -*-
# vim:fenc=utf-8

'''
  :copyright (c) 2014 Xavier Bruhiere.
  :license: MIT, see LICENSE for more details.
'''

import flask
import functools
import datetime as dt
import dna.utils


def api_url(full_version, resource):
    '''
    >>> # Harmonize api endpoints
    >>> # __version__ should be like major.minor.fix
    >>> from my_app import __version__
    >>> api_url(__version__, '/some/endpoint')
    /v0/some/endpoint
    '''
    return '/v{}/{}'.format(dna.utils.Version(full_version).major, resource)


def api_doc(full_version, resource, method='GET', **kwargs):
    '''
    >>> # Wrap api endpoints with more details
    >>> api_doc('/resource', secure=True, key='value')
    GET /resource?secure=true&key=value
    '''
    doc = '{} {}'.format(method, api_url(full_version, resource))
    params = '&'.join(['{}={}'.format(k, v) for k, v in kwargs.iteritems()])
    if params:
        doc = '?'.join([doc, params])
    return doc


# NOTE See also https://github.com/wcdolphin/flask-cors
# NOTE ALready included into flask-api, about to be removed
def crossdomain(origin=None, methods=None, headers=None,
                max_age=21600, attach_to_all=True,
                automatic_options=True):
    if methods is not None:
        methods = ', '.join(sorted(x.upper() for x in methods))
    if headers is not None and not isinstance(headers, basestring):
        headers = ', '.join(x.upper() for x in headers)
    if not isinstance(origin, basestring):
        origin = ', '.join(origin)
    if isinstance(max_age, dt.timedelta):
        max_age = max_age.total_seconds()

    def get_methods():
        if methods is not None:
            return methods

        options_resp = flask.current_app.make_default_options_response()
        return options_resp.headers['allow']

    def decorator(f):
        def wrapped_function(*args, **kwargs):
            if automatic_options and flask.request.method == 'OPTIONS':
                resp = flask.current_app.make_default_options_response()
            else:
                resp = flask.make_response(f(*args, **kwargs))
            if not attach_to_all and flask.request.method != 'OPTIONS':
                return resp

            h = resp.headers

            h['Access-Control-Allow-Origin'] = origin
            h['Access-Control-Allow-Methods'] = get_methods()
            h['Access-Control-Max-Age'] = str(max_age)
            if headers is not None:
                h['Access-Control-Allow-Headers'] = headers
            return resp

        f.provide_automatic_options = False
        return functools.update_wrapper(wrapped_function, f)
    return decorator
