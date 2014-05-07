#! /usr/bin/env python
# -*- coding: utf-8 -*-
# vim:fenc=utf-8
#
# Copyright (C) 2014 Hive Tech, SAS.


import unittest
import dna.utils as utils


class UtilsTestCase(unittest.TestCase):

    random_length = 64
    always_running_process = 'init'
    version_test = '0.4.1'

    def _check_sub_version(self, sub_version):
        self.assertTrue(isinstance(sub_version, int))
        self.assertTrue(sub_version >= 0)
        self.assertTrue(sub_version < 10)

    def test_dna_version_object(self):
        version = utils.Version(self.version_test)

        self._check_sub_version(version.major)
        self._check_sub_version(version.minor)
        self._check_sub_version(version.patch)

    def test_running_process_detection(self):
        self.assertTrue(utils.is_running(self.always_running_process))

    def test_not_running_process_detection(self):
        self.assertFalse(utils.is_running('no_chance_this_program_is_running'))

    def test_generate_name(self):
        new_name = utils.generate_random_name()
        #TODO Regex validation
        self.assertTrue(isinstance(new_name, str))
        new_name = utils.generate_random_name(size=4)
        self.assertTrue(len(new_name) == 4)

    def test_id_generator(self):
        new_id = utils.generate_unique_id()
        self.assertTrue(isinstance(new_id, str))
        self.assertTrue(len(new_id) == 36)

    def test_id_generator_unicity(self):
        new_id = utils.generate_unique_id()
        for _ in range(self.random_length):
            old_id = new_id
            new_id = utils.generate_unique_id()
            self.assertTrue(new_id != old_id)

    def test_truncate_float(self):
        original_float = 3.232999
        truncated_float = utils.truncate(original_float, n=2)
        self.assertIsInstance(truncated_float, float)
        self.assertGreater(original_float, truncated_float)

    def test_truncate_str(self):
        self.assertEqual(utils.truncate('nofloat'), 'nofloat')
