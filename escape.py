#!/usr/bin/env python3
import sys, string, textwrap
while c := sys.stdin.read(1):
    if c in "#&" or c not in string.printable:
        c = "%".join([""]+textwrap.wrap(hex(ord(c))[2:], 2))
    sys.stdout.write(c)
