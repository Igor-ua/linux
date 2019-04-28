**General information about receiving data from the bins (based on ubuntu)**

Check if the lib is installed:
```
ldconfig -p | grep libjpeg

libjpeg.so.8 (libc6,x86-64) => /usr/lib/x86_64-linux-gnu/libjpeg.so.8
libjpeg.so.8 (libc6) => /usr/lib/i386-linux-gnu/libjpeg.so.8
libjpeg.so (libc6,x86-64) => /usr/lib/x86_64-linux-gnu/libjpeg.so
```


Check dependency (are all libs accessible):
```
ldd silverback.bin 

linux-gate.so.1 (0xf7f7f000)
libdl.so.2 => /lib/i386-linux-gnu/libdl.so.2 (0xf7f48000)
libz.so.1 => /lib/i386-linux-gnu/libz.so.1 (0xf7f29000)
librt.so.1 => /lib/i386-linux-gnu/librt.so.1 (0xf7f1f000)
libpthread.so.0 => /lib/i386-linux-gnu/libpthread.so.0 (0xf7f00000)
libglib-2.0.so.0 => /usr/lib/i386-linux-gnu/libglib-2.0.so.0 (0xf7dd0000)
libcrypto.so.1.1 => /usr/lib/i386-linux-gnu/libcrypto.so.1.1 (0xf7aec000)
libstdc++.so.6 => /usr/lib/i386-linux-gnu/libstdc++.so.6 (0xf7966000)
libm.so.6 => /lib/i386-linux-gnu/libm.so.6 (0xf7864000)
libgcc_s.so.1 => /lib/i386-linux-gnu/libgcc_s.so.1 (0xf7846000)
libc.so.6 => /lib/i386-linux-gnu/libc.so.6 (0xf766a000)
/lib/ld-linux.so.2 (0xf7f81000)
libpcre.so.3 => /lib/i386-linux-gnu/libpcre.so.3 (0xf75f1000)
```

Check if library contains a function by it's name:
```
nm -D silverback.bin | grep EVP

  U EVP_DigestFinal
  U EVP_DigestInit_ex
  U EVP_DigestUpdate
  U EVP_get_digestbyname
  U EVP_MD_CTX_new
```

Find out the version of GLIB library:
```
strings /usr/lib/x86_64-linux-gnu/libstdc++.so.6 | grep GLIBCXX
...
GLIBCXX_3.4.19
GLIBCXX_3.4.20
GLIBCXX_3.4.21
GLIBCXX_3.4.22
GLIBCXX_3.4.23
GLIBCXX_3.4.24
GLIBCXX_3.4.25
GLIBCXX_DEBUG_MESSAGE_LENGTH
```




