#!python -u
# EASY-INSTALL-ENTRY-SCRIPT: 'mozrunner==5.35','console_scripts','mozrunner'
__requires__ = 'mozrunner==5.35'
import sys
from pkg_resources import load_entry_point

if __name__ == '__main__':
    sys.exit(
        load_entry_point('mozrunner==5.35', 'console_scripts', 'mozrunner')()
    )
