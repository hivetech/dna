#! /usr/bin/env python
# -*- coding: utf-8 -*-
# vim:fenc=utf-8

'''
  dna debug helpers
  -----------------

  :copyright (c) 2014 Xavier Bruhiere.
  :license: %LICENCE%, see LICENSE for more details.
'''

import os
import json


def activate_pdb_hook():
    ''' Catch exceptions with a prompt for post-mortem analyzis'''
    def debug_exception(type_exception, value, tb):
        import pdb
        pdb.post_mortem(tb)

    import sys
    sys.excepthook = debug_exception


#NOTE Could use pprint module
def emphasis(obj, align=True):
    ''' Clearer data printing '''
    if isinstance(obj, dict):
        if align:
            pretty_msg = os.linesep.join(
                ["%25s: %s" % (k, obj[k]) for k in sorted(obj.keys())])
        else:
            pretty_msg = json.dumps(obj, indent=4, sort_keys=True)
    else:
        return obj
    return pretty_msg
