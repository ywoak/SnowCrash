import sys

f = open(sys.argv[1],'rb')
encrypted = f.read()
for i, c in enumerate(encrypted):
    c -= i
    if 32 <= c < 128:
        print(chr(c), end='')
    else:
        print(' in hex:', c)
f.close()
