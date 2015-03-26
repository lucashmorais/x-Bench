#! /bin/python
import os
import sys
from subprocess import Popen, PIPE
import re

def main():
    if len(sys.argv) != 1:
        print "wrong number of argments"
    else:
	executeAll()
        
def executeAll():
    (stdout, stderr) = Popen(["time","./zip/zip30/zip","-r","/tmp/archive.zip","./zip/testes/"],stderr=PIPE,stdout=PIPE).communicate()
    #print stdout
    objMatch = re.match(r'(.+)user',stderr)
    print objMatch.groups()[0]

if __name__ == '__main__':
    main()


