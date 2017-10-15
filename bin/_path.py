#!/usr/bin/python
"""Path operations."""

import argparse
import os
import sys


def gen_uniq(iterable):
    seen = set()
    for item in iterable:
        if item not in seen:
            seen.add(item)
            yield item


def _path(var='PATH', sep=':'):
    path = os.environ[var]
    for item in path.split(sep):
        yield item.strip()


def _path_rm(path, *items):
    new_path = [
        item
        for item in path
        if item not in items
    ]
    return new_path


def _path_print(path_items, out, sep):
    out.write(sep.join(path_items))
    out.write('\n')


def _path_canon(path):
    return gen_uniq(path)


def path_canon(args):
    _path_print(_path_canon(_path(args.var, args.sep)), args.out, args.sep)
    return 0


def path_pretty(args):
    for item in _path(args.var, args.sep):
        args.out.write(item)
        args.out.write('\n')
    return 0


def path_multi(args):
    path = _path(args.var, args.sep)
    for line in sys.stdin:
        parts = line.split()
        cmd = parts[0]
        item = parts[1]
        adds_pre = []
        adds_post = []
        rms = []
        if cmd == 'add':
            try:
                prepend = bool(parts[2])
            except IndexError:
                prepend = False
            if prepend:
                adds_pre.append(item)
            else:
                adds_post.append(item)
        elif cmd == 'rm':
            rms.append(item)
        if rms:
            path = _path_rm(path, *rms)
        if adds_pre:
            path = _path_add(path, *adds_pre, prepend=True)
        if adds_post:
            path = _path_add(path, *adds_pre, prepend=False)
    _path_print(_path_canon(path), args.out, args.sep)
    return 0


# def _path_add(path, *items, prepend=False, maybe=False):
def _path_add(path, *items, **kwargs):
    prepend = kwargs.get('prepend', False)
    maybe = kwargs.get('maybe', False)
    if maybe:
        if all(item in path for item in items):
            return 0
    new_path = _path_rm(path, *items)
    if prepend:
        new_path = list(items) + new_path
    else:
        new_path = new_path + list(items)
    return new_path


def path_add(args):
    new_path = _path_add(_path(args.var, args.sep), args.item,
                         prepend=args.prepend, maybe=args.maybe)
    _path_print(new_path, args.out, args.sep)
    return 0


def path_check(args):
    for item in _path(args.var, args.sep):
        if item == args.item:
            return 0
    return 1


def path_rm(args):
    new_path = _path_rm(_path(args.var, args.sep), args.item)
    _path_print(new_path, args.out, args.sep)
    return 0


def _parser():
    parser = argparse.ArgumentParser()
    parser.add_argument('--var', default='PATH', nargs='?')
    parser.add_argument('--sep', default=':', nargs='?')
    parser.add_argument('--out', default=sys.stdout, nargs='?')
    subparsers = parser.add_subparsers()

    sub = subparsers.add_parser('canon')
    sub.set_defaults(func=path_canon)

    sub = subparsers.add_parser('pretty')
    sub.set_defaults(func=path_pretty)

    sub = subparsers.add_parser('multi')
    sub.set_defaults(func=path_multi)

    sub = subparsers.add_parser('add')
    sub.add_argument('--prepend', default=False, action='store_true')
    sub.add_argument('--maybe', default=False, action='store_true')
    sub.add_argument('item')
    sub.set_defaults(func=path_add)

    sub = subparsers.add_parser('check')
    sub.add_argument('item')
    sub.set_defaults(func=path_check)

    sub = subparsers.add_parser('rm')
    sub.add_argument('item')
    sub.set_defaults(func=path_rm)

    return parser


def main():
    """Run the command."""
    args = _parser().parse_args()
    try:
        return args.func(args)
    except AttributeError:
        return path_pretty(args)


if __name__ == '__main__':
    sys.exit(main())
