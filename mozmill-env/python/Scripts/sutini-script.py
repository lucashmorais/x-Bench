#!python -u
# EASY-INSTALL-ENTRY-SCRIPT: 'mozdevice==0.44','console_scripts','sutini'
__requires__ = 'mozdevice==0.44'
import sys
from pkg_resources import load_entry_point

if __name__ == '__main__':
    sys.exit(
        load_entry_point('mozdevice==0.44', 'console_scripts', 'sutini')()
    )
