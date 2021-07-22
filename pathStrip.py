import os
from os.path import dirname, abspath
print("apk paths Loaded Successfully......")

old_file=open(os.path.join(dirname(os.getcwd()),"adbpath.txt"),"r")
new_file=open(os.path.join(dirname(os.getcwd()),"finalPaths.txt"),"w")

for line in old_file:
    new_file.write(line[8:])