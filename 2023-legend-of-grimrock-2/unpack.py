#!/usr/bin/env python3
import zlib
import sys


def get_header(buffer):
   for i in range(5):
     l = buffer[0]
     yield buffer[4:l+4].decode("iso-8859-1")
     buffer = buffer[4+l:]

def unpack(filename):
    with open(filename, "rb") as f:
        d = f.read()

    d = d[8:]
    z = zlib.decompress(d)
    print(filename, '\t', '\t'.join(get_header(z[8:2000])))

    with open(filename + ".unpacked", "wb") as f:
        f.write(z)

print("Unpacking files given in command line")

for f in sys.argv[1:]:
  unpack(f)

