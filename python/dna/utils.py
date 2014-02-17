# -*- coding: utf-8 -*-
# vim:fenc=utf-8

'''
  :copyright (c) 2014 Hive Tech, SAS.
  :license: Apache 2.0, see LICENSE for more details.
'''

import sh
import os
import string
import random
import uuid
import docker
import requests
import json
import re
import socket
from urllib2 import urlopen
from dna.errors import ImportContextFailed


class Version(object):
    ''' Provide a convenient way to manipulate version '''
    #NOTE Use git tag ?
    def __init__(self, version):
        _version = version.split('.')
        self.major = int(_version[0])
        self.minor = int(_version[1])
        self.patch = int(_version[2])


def is_running(process):
    ''' `pgrep` returns an error code if no process was found '''
    try:
        pgrep = sh.Command('/usr/bin/pgrep')
        pgrep(process)
        flag = True
    except sh.ErrorReturnCode_1:
        flag = False
    return flag


def generate_random_name(size=8, chars=string.ascii_lowercase + string.digits):
    ''' Create a random name to assign to a node '''
    return ''.join(random.choice(chars) for _ in range(size))


def docker_check():
    docker_url = os.environ.get('DOCKER_URL', 'unix://var/run/docker.sock')
    dock = docker.Client(base_url=docker_url, timeout=5)
    try:
        docker_version = dock.version()
        status = True
    except requests.ConnectionError, error:
        docker_version = {'error': str(error)}
        status = False
    except requests.Timeout, error:
        docker_version = {'error': str(error)}
        status = False
    return docker_version, status


def generate_unique_id():
    event_id = uuid.uuid4().get_urn()
    return event_id.split(':')[-1]


def dynamic_import(mod_path, obj_name):
    ''' Take a string and return the corresponding module '''
    try:
        module = __import__(mod_path, fromlist=['whatever'])
    except ImportError, error:
        raise ImportContextFailed(
            module='.'.join([mod_path, obj_name]), reason=error)

    if hasattr(module, obj_name):
        obj = getattr(module, obj_name)
    else:
        raise ImportContextFailed(
            module='.'.join([mod_path, obj_name]),
            reason='module {} has no attribute {}'.
                   format(module.__name__, obj_name))
        return None

    return obj


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


def self_ip(public=False):
    ''' Utility for logbook information injection '''
    if public:
        data = str(urlopen('http://checkip.dyndns.com/').read())
        ip_addr = re.compile(
            r'Address: (\d+\.\d+\.\d+\.\d+)').search(data).group(1)
    else:
        sock = socket.socket(socket.AF_INET, socket.SOCK_DGRAM)
        sock.connect(('google.com', 0))
        ip_addr = sock.getsockname()[0]
    return ip_addr
