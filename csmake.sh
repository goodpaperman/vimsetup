#! /bin/sh
# filter out all source files in project and processed later by cscope..

find . -name '*.cpp' -o -name '*.cc' -o -name '*.h' > cscope.files
cscope -b -q 
