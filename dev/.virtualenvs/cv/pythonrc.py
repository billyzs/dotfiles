# -*- coding: utf-8 -*-

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
