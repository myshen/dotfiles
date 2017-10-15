"""
Python startup file.
"""
import sys
import os.path

sys.path.insert(0, os.path.expanduser('~/.dotfiles'))
from tools import *
sys.path.insert(0, os.path.expanduser('~/src/infinity'))
from cyltools import Cylance, CR
