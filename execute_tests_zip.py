#! /bin/python
import os
import sys
from subprocess import Popen, PIPE
import re

def main():
    if len(sys.argv) != 2:
        print "wrong number of argments"
    else:
        if int(sys.argv[1]) == 0:
            compile()
        elif int(sys.argv[1]) == 1:
            executeAll()
        else:
            print "invalid option!"
        
def compileAll():
    command3 = "make -f ./zip/zip30/unix/Makefile generic_gcc"
    os.system(command3)

def executeAll():
    (stdout, stderr) = Popen(["time","./zip/zip30/zip","-r","/tmp/archive.zip","./zip/testes/"],stderr=PIPE,stdout=PIPE).communicate()
    #print stdout
    objMatch = re.match(r'(.+)user',stderr)
    print objMatch.groups()[0]

if __name__ == '__main__':
    main()


