#!python -u
# EASY-INSTALL-ENTRY-SCRIPT: 'mozprofile==0.23','console_scripts','view-profile'
__requires__ = 'mozprofile==0.23'
import sys
from pkg_resources import load_entry_point

if __name__ == '__main__':
    sys.exit(
        load_entry_point('mozprofile==0.23', 'console_scripts', 'view-profile')()
    )
