#!python -u
# EASY-INSTALL-ENTRY-SCRIPT: 'mozlog==2.10','console_scripts','structlog'
__requires__ = 'mozlog==2.10'
import sys
from pkg_resources import load_entry_point

if __name__ == '__main__':
    sys.exit(
        load_entry_point('mozlog==2.10', 'console_scripts', 'structlog')()
    )
