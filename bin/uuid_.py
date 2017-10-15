#!/usr/bin/env python

from __future__ import print_function

import sys
import uuid
from datetime import datetime, timedelta


def main(argv):
    if len(argv) < 2:
        # generate one
        print(str(uuid.uuid4()))
        #print("Usage:", argv[0], "<unix timestamp>")
        return 0
    ustr = argv[1]
    uid = uuid.UUID(ustr)
    if str(uid) == ustr:
        print(uid.hex.upper())
    else:
        print(uid)


if __name__ == '__main__':
    sys.exit(main(sys.argv))
