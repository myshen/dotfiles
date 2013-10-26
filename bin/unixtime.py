#!/usr/bin/env python

import sys
from datetime import datetime, timedelta


def main(argv):
    if len(argv) < 2:
        print "Usage:", argv[0], "<unix timestamp>"
        return 1
    seconds = argv[1]
    epoch = datetime(1970, 1, 1)
    tdelt = timedelta(seconds=float(seconds))
    print epoch + tdelt


if __name__ == '__main__':
	sys.exit(main(sys.argv))

