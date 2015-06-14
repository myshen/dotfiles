#!/usr/bin/env python

import sys
import os.path


def main(argv):
    verold = '2.7.6'
    vernew = '2.7.6_1'
    for root, dirs, files in os.walk(os.getcwd()):
        for fname in files:
            fpath = os.path.join(root, fname)
            if not os.path.islink(fpath):
                continue
            target = os.readlink(fpath)
            new_targ = target.replace(verold, vernew)
            try:
                os.symlink(new_targ, fpath)
            except OSError:
                os.unlink(fpath)
                try:
                    os.symlink(new_targ, fpath)
                except OSError:
                    os.symlink(targ, fpath)
    return 0


if __name__ == '__main__':
	sys.exit(main(sys.argv))

