#!python -u
# EASY-INSTALL-ENTRY-SCRIPT: 'mozdownload==1.13','console_scripts','mozdownload'
__requires__ = 'mozdownload==1.13'
import sys
from pkg_resources import load_entry_point

if __name__ == '__main__':
    sys.exit(
        load_entry_point('mozdownload==1.13', 'console_scripts', 'mozdownload')()
    )
