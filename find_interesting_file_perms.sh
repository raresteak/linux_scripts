#!/bin/bash

#suid files
find / -perm /4000 -type f -exec ls -l {} \; 2>/dev/null

#sgid files
find / -perm /4000 -type f -exec ls -l {} \; 2>/dev/null

# Find files you have write access to through Unix group membership which you are not the owner
for i in $(id -G); do find / -type f \! -user $(whoami) -gid $i -perm /g+w -exec ls -l {} \; 2>/dev/null | grep -v proc\/ ; done

#find files with world write for which you are not the owner
find / -perm /o+w \! -user $(whoami) -type f -exec ls -l {} \;  2>/dev/null | grep -v proc\/ | grep -v cgroup\/ | grep -v \/sys\/


