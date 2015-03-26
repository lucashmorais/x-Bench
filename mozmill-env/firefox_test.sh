#!/bin/bash

FULL_PATH=$( readlink -f "$0" )
SCRIPT_PATH=$( dirname "$FULL_PATH" )

cd "$SCRIPT_PATH"
python FirefoxTest.py
