#!python -u
# EASY-INSTALL-ENTRY-SCRIPT: 'mozmill==2.0.10','console_scripts','mozmill'
__requires__ = 'mozmill==2.0.10'
import sys
from pkg_resources import load_entry_point

if __name__ == '__main__':
    sys.exit(
        load_entry_point('mozmill==2.0.10', 'console_scripts', 'mozmill')()
    )
