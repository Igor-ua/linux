**General information for debugging bins (based on ubuntu)**

dbg:
```
dbg
break file.cpp:line
rbreak file.cpp:.
set print elements 1000

c - continue
n - next break point
p path - show var value
list - shows around
r - restart
q - quit
```

Example of the debugging a file:
```
(gdb) rbreak file:.
(gdb) rbreak main_linux.cpp:.
(gdb) rbreak tl_python.cpp:.

[CPP]   [2018.11.25 - 23:07:25]   masterserver.savage.s2games.com resolved to 162.243.214.228

Breakpoint 2, System_ChangeRootDir (newdir=0x8d3f220 <buf+45056> "//game") at Core/main_linux.cpp:243
243 {
(gdb) c

[CPP]   [2018.11.25 - 23:07:28]   Port 55497 opened

Breakpoint 6, System_InitGameDLL () at Core/main_linux.cpp:58
58  {
(gdb) c

Breakpoint 1, System_InitGameDLL () at Core/main_linux.cpp:79
79          log_timestamp("%s%s", _("Savage on Linux - Dedicated Server Core build "),  __DATE__ " " __TIME__ "");
(gdb) c

[CPP]   [2018.11.25 - 23:07:44]   Savage on Linux - Dedicated Server Core build Nov 25 2018 21:46:56
warning: Could not load shared library symbols for ../libs/libpython3.7m.so.1.0.
Do you need "set solib-search-path" or "set sysroot"?

Program received signal SIGSEGV, Segmentation fault.
```