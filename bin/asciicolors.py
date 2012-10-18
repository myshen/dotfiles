#!/usr/bin/env python
# http://superuser.com/questions/285381/how-does-the-tmux-color-palette-work

COLORS = {
    'YELLOW': '\x1b\x5b1;33m',
    'CYAN': '\x1b\x5b1;36m',
    'CLEAR': '\x1b\x5b0m',
}

for c, v in COLORS.items():
    if c == 'CLEAR': continue
    print v, c, COLORS['CLEAR']


print
print 'TERMCOLORS'

base = '\x1b\x5b%d;%dm'

b = 0
for c in range(0, 50):
    print base % (b, c), b, c, COLORS['CLEAR'], '\t',
    if c % 10 == 9:
        print

b = 1
for c in range(0, 50):
    print base % (b, c), b, c, COLORS['CLEAR'], '\t',
    if c % 10 == 9:
        print


print
print 'COLOURXXX'

base_colourxxx = '\x1b[38;5;{c}mcolour{c}'
for c in range(256):
    print base_colourxxx.format(c=c), '\t',
    if c % 8 == 7:
        print
