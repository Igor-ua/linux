**General information for building bins (based on ubuntu)**

To specify a directory to search for (binary) libraries, you just use -L:

`-L/location/lib`

To specify the actual library name, you use -l (links libfoo.a or libfoo.so):

`-lfoo`

To specify a directory to search for include files (different from libraries!) you use -I:

`-I/location/include/headers`


How to add a static library into a c program
```
You want:
g++ -L.  prog.cpp -lfoo

Unfortunately, the ld linker is sensitive to the order of libraries.
When trying to satisfy undefined symbols in prog.cpp, it will only look at libraries that appear AFTER prog.cpp on the command line.

You can also just specify the library (with a path if necessary) on the command line, and forget about the -L flag:

g++ prog.cpp libfoo.a
```

```
You must always set -L/location first and -llibName as a second param (where you search and what you search)
```

C build example: 
```
#!/bin/bash

rm main
clear

g++ -Wall -O2 --std=c++11 -L./lib -I./headers -o main main.cpp utils.cpp -lfmt -Wunused-variable

./main
```