#!python -u
# EASY-INSTALL-ENTRY-SCRIPT: 'mozmill-automation==2.0.10','console_scripts','testrun_update'
__requires__ = 'mozmill-automation==2.0.10'
import sys
from pkg_resources import load_entry_point

if __name__ == '__main__':
    sys.exit(
        load_entry_point('mozmill-automation==2.0.10', 'console_scripts', 'testrun_update')()
    )