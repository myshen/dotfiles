#!/usr/bin/env python
import sys

from lxml import etree


def pretty_print_xml(file, output=None):
    """ 
        file - file obj or filename
    """
    assert file is not None
    parser = etree.XMLParser(resolve_entities=False, strip_cdata=False)
    document = etree.parse(file, parser)
    if output is None:
        ouptut = file
    document.write(output, pretty_print=True, encoding='utf-8')


def main(argv):
    assert len(argv) is 2
    filename = argv[1]
    pretty_print_xml(filename, sys.stdout)
    return 0


if __name__ == '__main__':
    sys.exit(main(sys.argv))
