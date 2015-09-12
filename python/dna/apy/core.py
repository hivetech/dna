# -*- coding: utf-8 -*-
# vim:fenc=utf-8

'''
  Core Flask RESTFul app
  ----------------------

  :copyright (c) 2014 Xavier Bruhiere.
  :license: MIT, see LICENSE for more details.
'''

import os
from docopt import docopt
import flask
import mongoengine
from flask.ext import restful
from flask.ext.mongoengine import MongoEngine
import dna.logging

log = dna.logging.logger(__name__)

DEFAULT_DOC = '''Apy api

Usage:
  api -h | --help
  api --version
  api [--bind=<ip>] [--port=<port>] [-d | --debug] [--log=<level>]

Options:
  -h --help       Show this screen.
  --version       Show version.
  --debug         Activates Flask debug
  --bind=<ip>     Listens on the given ip [default: 127.0.0.1]
  --port=<port>   Listens on the given port [default: 5000]
  --log=<level>   Log output level [default: debug]
'''


class App(object):
    '''
    Setup a flask server
    '''

    def __init__(self, sentry_dns=None):
        ''' Setup default Flask app and sentry '''
        self.app = flask.Flask(__name__)
        self.app.config.update(
            PROPAGATE_EXCEPTIONS=False,
            PRESERVE_CONTEXT_ON_EXCEPTION=True,
            SECRET_KEY='vbrzbbzrrbz'
        )

        # Optionally activate Sentry (https://getsentry.com/welcome/)
        sentry_dns = sentry_dns or os.environ.get('SENTRY_DNS')
        if sentry_dns:
            from raven.contrib.flask import Sentry
            Sentry(self.app, dsn=sentry_dns)

    def setup_routes(self, routes):
        api = restful.Api(self.app)
        for endpoint, resource in routes.iteritems():
            api.add_resource(resource, endpoint)

    def setup_db(self):
        self.app.config.update(
            MONGODB_SETTINGS={
                'DB': os.environ.get('MONGODB_NAME', 'apy'),
                'HOST': os.environ.get('MONGODB_HOST', 'localhost'),
                'PORT': int(os.environ.get('MONGODB_PORT', 27017))
            }
        )
        try:
            self.db = MongoEngine(self.app)
        except mongoengine.connection.ConnectionError as error:
            log.error(error)
            raise

    def serve(self, app_docopt=DEFAULT_DOC, description=''):
        ''' Configure from cli and run the server '''

        exit_status = 0
        if isinstance(app_docopt, str):
            args = docopt(app_docopt, version=description)
        elif isinstance(app_docopt, dict):
            args = app_docopt
        else:
            raise ValueError('unknown configuration object ({})'
                             .format(type(app_docopt)))
        log_level = args.get('--log', 'debug')
        is_debug = args.get('--debug', False)
        # TODO More serious default
        log_output = 'stdout' if is_debug else 'apy.log'
        safe_bind = args.get('--bind', '127.0.0.1')
        safe_port = int(args.get('--port', 5000))
        log_setup = dna.logging.setup(level=log_level, output=log_output)

        with log_setup.applicationbound():
            try:
                log.info('server ready',
                         version=description,
                         log=log_level,
                         debug=is_debug,
                         bind='{}:{}'.format(safe_bind, safe_port))

                self.app.run(host=safe_bind,
                             port=safe_port,
                             debug=is_debug)

            except Exception as error:
                if is_debug:
                    raise
                log.error('{}: {}'.format(type(error).__name__, str(error)))
                exit_status = 1

            finally:
                log.info('session ended with status {}'.format(exit_status))

        return exit_status


Application = App()


if __name__ == '__main__':
    import dna.apy.resources as resources
    routes = {
        '/users/<string:username>': resources.User,
        '/test': resources.TestRestricted
    }
    Application.setup_routes(routes)
    Application.serve()
