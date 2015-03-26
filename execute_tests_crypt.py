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
    command2 = "./openaes/test_performance -key 256 -data 2 > ./resultados/teste_aes.txt"
    fn = os.path.join(os.path.dirname(__file__), 'openaes/test_performance')
    
    (stdout, stderr) = Popen([fn,"-key","256","-data","50"],stdout=PIPE).communicate()
    resultado = stdout[stdout.index("time:") + len("time:") : stdout.index("seconds")]
    print int(resultado)

if __name__ == '__main__':
    main()


