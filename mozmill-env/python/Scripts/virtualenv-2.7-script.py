#!python -u
# EASY-INSTALL-ENTRY-SCRIPT: 'virtualenv==1.11.6','console_scripts','virtualenv-2.7'
__requires__ = 'virtualenv==1.11.6'
import sys
from pkg_resources import load_entry_point

if __name__ == '__main__':
    sys.exit(
        load_entry_point('virtualenv==1.11.6', 'console_scripts', 'virtualenv-2.7')()
    )
