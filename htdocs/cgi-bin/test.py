#!/usr/bin/env python3
import sys
import traceback
print("Content-Type: text/html")
print("")
sys.stderr = sys.stdout
try:
    ...your code here...
except:
    print "\n\n<PRE>"
    traceback.print_exc()
