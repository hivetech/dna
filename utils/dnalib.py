#! /usr/bin/env python
# -*- coding: utf-8 -*-
# vim:fenc=utf-8
#
# Copyright © 2013 xavier <xavier@laptop-300E5A>
#
# Distributed under terms of the MIT license.


import clint.textui as ui
import sys
import os
import inspect


class Help(object):
    '''
    Common syntax to display help
    '''
    help_command = None
    message = []

    def _builtin_help(self):
        if self.help_command:
            os.system(self.help_command)

    def show(self):
        if isinstance(self.message, str):
            self.message = [self.message]
        for msg in self.message:
            log(msg)
        self._builtin_help()


def fail(message):
    ui.puts(ui.colored.red("[{}] ** error: {}".format(
        inspect.stack()[1][3], message)))


def die(message, code):
    fail(message)
    sys.exit(code)


def success(message):
    ui.puts(ui.colored.green(message))


def log(message):
    ui.puts(ui.colored.blue(message))
