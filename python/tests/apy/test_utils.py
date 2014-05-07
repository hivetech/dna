# -*- coding: utf-8 -*-
# vim:fenc=utf-8

import unittest
from nose.tools import eq_
import dna.apy.utils as utils


class UtilsTestCase(unittest.TestCase):

    def setUp(self):
        self.resource_test = 'node/test'

    def test_api_url(self):
        formatted_url = utils.api_url('1.2.3', self.resource_test)
        eq_(formatted_url, '/v1/' + self.resource_test)

    def test_api_doc(self):
        doc = utils.api_doc(
            '1.2.3', self.resource_test, method='GET', key='value', test=True)
        eq_(doc, 'GET /v1/{}?test=True&key=value'.format(self.resource_test))
