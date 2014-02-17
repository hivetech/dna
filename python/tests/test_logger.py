# -*- coding: utf-8 -*-
# vim:fenc=utf-8


import unittest
import os
import logbook
import dna.logger as logger
import dna.settings as settings


class LoggerTestCase(unittest.TestCase):

    def test_unique_id_processor(self):
        event = logger.add_unique_id(None, None, {})
        self.assertTrue(isinstance(event['id'], str))
        self.assertTrue(len(event['id']) == 36)

    def test_timestamp_processor(self):
        the_past = 1392396395
        event = logger.add_timestamp(None, None, {})
        self.assertTrue(isinstance(event['timestamp'], int))
        self.assertTrue(event['timestamp'] > the_past)

    def test_get_dna_logger(self):
        log = logger.logger('batman')
        self.assertTrue(hasattr(log, 'msg'))
        self.assertTrue(isinstance(log._logger, logbook.base.Logger))
        self.assertTrue(log._logger.name == 'batman')

    def test_logger_default_setup(self):
        setup = logger.setup()
        handler = setup.objects[1]
        self.assertTrue(isinstance(
            handler, logbook.handlers.FileHandler))
        self.assertTrue(handler.level_name == 'DEBUG')
        self.assertTrue(handler.stream.name == settings.LOG['file'])

    def test_logger_custom_file_setup(self):
        custom_level = 'warning'
        custom_logfile = '/tmp/test-dna.log'
        setup = logger.setup(level=custom_level, filename=custom_logfile)
        handler = setup.objects[1]
        self.assertTrue(isinstance(
            handler, logbook.handlers.FileHandler))
        self.assertTrue(handler.level_name == custom_level.upper())
        self.assertTrue(handler.stream.name == custom_logfile)

    def test_write_log_to_file(self):
        os.remove(settings.LOG['file'])
        setup = logger.setup()
        body = 'TDD is awesome'
        event_type = 'test'
        with setup.applicationbound():
            log = logger.logger()
            log.info(event_type, body=body)
            self.assertTrue(os.path.exists(settings.LOG['file']))
            with open(settings.LOG['file'], 'r') as fd:
                text = fd.read()
                for required_info in \
                        [body, event_type, 'id',
                         'INFO', 'dna.logger', 'timestamp']:
                    self.assertTrue(required_info in text)
