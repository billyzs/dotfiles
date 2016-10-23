# -*- coding: utf-8 -*-
"""Best goddamn .pythonrc file in the whole world.
This file is executed when the Python interactive shell is started if
$PYTHONSTARTUP is in your environment and points to this file. It's just
regular Python commands, so do what you will. Your ~/.inputrc file can greatly
complement this file.
"""
# Imports we need
import sys
import os
import readline, rlcompleter
import atexit
import pprint
from tempfile import mkstemp
from code import InteractiveConsole

# Imports we want
try:
    import cv2
    print("imported cv2")
    import numpy as np
    print("imported numpy as np")
except ImportError as e:
    for error in e:
        print("Failed to import {}".format(e.name))
