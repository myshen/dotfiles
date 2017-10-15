def enable_repl_readline():
    import readline
    import rlcompleter
    import atexit
    import os

    # tab completion
    readline.parse_and_bind('tab: complete')

    # history file
    histfile = os.path.join(os.environ['HOME'], '.pythonhistory')
    try:
        readline.read_history_file(histfile)
    except IOError:
        pass
    atexit.register(readline.write_history_file, histfile)
enable_repl_readline()


#def add_global_site():
#    import site
## ~/.local/lib/python2.7/site-packages/homebrew.pth
#
#    #site.addsitedir('/usr/local/lib/python2.7/site-packages')
#add_global_site()


import sys
import os.path

from base64 import b64decode as b64d, b64encode as b64e
import binascii
tohex = binascii.hexlify
tobin = binascii.unhexlify
import json
import time
import gzip
from hashlib import md5, sha256
import calendar
from datetime import datetime, date, timedelta
import uuid
from uuid import UUID, uuid4
from functools import partial
from difflib import context_diff as ctxdiff_
from contextlib import contextmanager
from pprint import pprint, pformat
import socket
import signal
import random


def tohex_string(string):
    """e.g. '\\xE4~\\x16oO\\xF6M\\x89\\xAA\\x06\\x02\\x02\\x00\\x1F\\xD6R' -> e47e166f4ff64d89aa060202001fd652

    """
    import codecs
    return tohex(codecs.escape_decode(string)[0])
    # return tohex(string.decode('string-escape'))


class Dateconv:

    @staticmethod
    def rfc3339_to_dtime(rfctime):
        return datetime.strptime(rfctime, '%Y-%m-%dT%H:%M:%SZ')

    @staticmethod
    def dtime_to_unix(dtime):
        return calendar.timegm(dtime.timetuple())

    @staticmethod
    def rfc3339_to_unix(dstr):
        return dtime_to_unix(rfc3339_to_dtime(dstr))

    @staticmethod
    def unix_to_dtime(unix):
        return datetime.fromtimestamp(unix)


# doesn't work for DNS lookups
socket.setdefaulttimeout(5)


@contextmanager
def timeout(duration=1):

    class TimeoutError(Exception):
        pass

    def handler(signum, frame):
        raise TimeoutError()

    # set the timeout handler
    previous_handler = signal.signal(signal.SIGALRM, handler)
    try:
        signal.alarm(duration)
        yield
    finally:
        signal.alarm(0)
        signal.signal(signal.SIGALRM, previous_handler)


def ctxdiff(*args, **kwargs):
    for i in ctxdiff_(*args, **kwargs):
        print(i)

if sys.version_info.major >= 3 and sys.version_info.minor >= 4:
    import asyncio; loop = asyncio.get_event_loop(); arun = loop.run_until_complete
    from aioredis import Redis as AR
    from base64 import b85decode as b85d, b85encode as b85e

try:
    import msgpack
except ImportError:
    pass

try:
    from redis import StrictRedis as SR_
except ImportError:
    pass
else:
    r_args = dict(socket_connect_timeout=1, socket_timeout=1)
    SR = partial(SR_, **r_args)


    class UsefulRedis(SR_):

        def zsummarize(self, key):
            return {
                "min": self.zrange(key, 0, 0, withscores=True)[0],
                "max": self.zrange(key, -1, -1, withscores=True)[0],
                "count": self.zcard(key),
            }

        def delkeys(self, keys):
            with self.pipeline() as pipe:
                for k in keys:
                    pipe.delete(k)
                pipe.execute()


    UR_ = UsefulRedis
    UR = partial(UR_, **r_args)
