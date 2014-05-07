#! /usr/bin/env python
# -*- coding: utf-8 -*-
# vim:fenc=utf-8
#
# Copyright (C) 2014 Hive Tech, SAS.


import unittest
import pytz
import datetime as dt
import dna.time_utils as time_utils


class TimeUtilsTestCase(unittest.TestCase):

    def test_normalize_epoch_date(self):
        epoch_date = 15334321432
        norm_date = time_utils.normalize_date_format(epoch_date)
        self.assertIsInstance(norm_date, dt.datetime)
        self.assertEquals(norm_date.tzinfo, pytz.utc)

    def test_timezone_detection(self):
        timezone = time_utils._detect_timezone()
        self.assertIsInstance(timezone, str)
        details = timezone.split('/')
        self.assertEqual(len(details), 2)

    def test_normalize_human_date(self):
        human_date = '23h16'
        norm_date = time_utils.normalize_date_format(human_date)
        self.assertIsInstance(norm_date, dt.datetime)
        self.assertEqual(norm_date.minute, 16)
        self.assertEquals(norm_date.tzinfo, pytz.utc)

    def test_normalize_naive_date(self):
        naive_date = dt.datetime.now()
        norm_date = time_utils.normalize_date_format(naive_date)
        self.assertIsInstance(norm_date, dt.datetime)
        self.assertEquals(norm_date.tzinfo, pytz.utc)

    def test_utc_date_to_epoch(self):
        utc_date = dt.datetime(2012, 12, 1, tzinfo=pytz.utc)
        epoch = time_utils.UTC_date_to_epoch(utc_date)
        self.assertIsInstance(epoch, int)
        self.assertGreater(epoch, 1000000000)

    def test_epoch_to_date(self):
        date = time_utils.epoch_to_date(1392934500)
        self.assertIsInstance(date, dt.datetime)
        self.assertEquals(date.tzinfo, pytz.utc)

    def test_epoch_conversions(self):
        date = dt.datetime(2012, 12, 1, tzinfo=pytz.utc)
        epoch = time_utils.UTC_date_to_epoch(date)
        new_date = time_utils.epoch_to_date(epoch)
        self.assertEqual(date, new_date)
