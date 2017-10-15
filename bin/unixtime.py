#!/usr/bin/env python

from __future__ import print_function

import sys
import time
from datetime import datetime, timedelta


def main(argv):
    if len(argv) < 2:
        print(time.time())
        #print("Usage:", argv[0], "<unix timestamp>")
        return 0
    seconds = argv[1]
    epoch = datetime(1970, 1, 1)
    tdelt = timedelta(seconds=float(seconds))
    print(epoch + tdelt)


if __name__ == '__main__':
    sys.exit(main(sys.argv))
