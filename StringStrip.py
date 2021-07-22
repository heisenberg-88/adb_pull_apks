import os
from os.path import dirname, abspath
print("pkgsList Loaded Successfully......")

old_file=open(os.path.join(dirname(os.getcwd()),"pkgslist.txt"),"r")
new_file=open(os.path.join(dirname(os.getcwd()),"appPaths.txt"),"w")
for line in old_file:
    print(line[8:])
    new_file.write(line[8:])
    