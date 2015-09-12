# -*- coding: utf-8 -*-
# vim:fenc=utf-8

'''
  :copyright (c) 2014 Xavier Bruhiere.
  :license: MIT, see LICENSE for more details.
'''

import os
import abc
import click


class Cli(object):
    '''
    Convenient wrapper around UI interface boilerplate.
    Make the app prettier and more robust.
    '''

    __metaclass__ = abc.ABCMeta

    # TODO Allow more styling
    _default_style = {
        'primary-color': 'blue',
        'success-color': 'green',
        'heading-color': 'white',
        'error-color': 'red'
    }

    def __init__(self, title, style=None):
        self._mode = None
        self.style = style or self._default_style
        click.clear()
        self.heading('{} [{} mode]'.format(title, self.mode))

    def _print(self, text, **kwargs):
        click.secho(text, **kwargs)

    @property
    def mode(self):
        return self._mode or os.environ.get('APP_ENV', 'development')

    @mode.setter
    def mode(self, value):
        self._mode = value

    def heading(self, text):
        self._print('\n{}\n'.format(text),
                    bold=True, fg=self.style['heading-color'], underline=True)

    def msg(self, text, **kwargs):
        self._print(text, fg=self.style['primary-color'], **kwargs)

    def success(self, text):
        self._print(text, fg=self.style['success-color'], bold=True)

    def error(self, text):
        self._print('\n{}\n'.format(text),
                    fg=self.style['error-color'], bold=True)

    @abc.abstractmethod
    def run(self):
        pass

    def __call__(self, *args, **kwargs):
        ''' Golang style function that safely calls main routine '''
        exit_result = None
        exit_error = None
        try:
            exit_result = self.run(*args, **kwargs)
            self.success('Done without error.')
        except KeyboardInterrupt:
            self.error('Received SIGINT signal, aborting.')
        except Exception as error:
            self.error('!!!!!!     CRASH     !!!!!!')
            if self.mode == 'development':
                raise
            exit_error = ['{}: {}'.format(type(error).__name__, str(error))]
            if hasattr(error, 'kwargs'):
                for k, v in error.kwargs.iteritems():
                    exit_error.append('{}: {}'.format(k, v))
            exit_error = '\n'.join(exit_error)

        return exit_result, exit_error
