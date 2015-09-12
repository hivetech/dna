# -*- coding: utf-8 -*-
# vim:fenc=utf-8

'''
  Scientific utilities
  --------------------

  :copyright (c) 2014 Xavier Bruhiere.
  :license: Apahe 2.0, see LICENSE for more details.
'''


def round_if_close(number, target=0.0, approx=0.01):
    return target if abs(number - target) < approx else number
