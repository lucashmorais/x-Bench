#!python -u
# EASY-INSTALL-ENTRY-SCRIPT: 'mozInstall==1.11','console_scripts','mozinstall'
__requires__ = 'mozInstall==1.11'
import sys
from pkg_resources import load_entry_point

if __name__ == '__main__':
    sys.exit(
        load_entry_point('mozInstall==1.11', 'console_scripts', 'mozinstall')()
    )
