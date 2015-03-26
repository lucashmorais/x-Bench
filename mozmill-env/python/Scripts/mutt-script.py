#!python -u
# EASY-INSTALL-ENTRY-SCRIPT: 'mutt==0.1','console_scripts','mutt'
__requires__ = 'mutt==0.1'
import sys
from pkg_resources import load_entry_point

if __name__ == '__main__':
    sys.exit(
        load_entry_point('mutt==0.1', 'console_scripts', 'mutt')()
    )
