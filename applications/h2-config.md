**H2 database configuration**

Starting H2 Tcp Server on linux
```
#!/bin/sh

dir="/home/igor/stats/savage-xr-statistic/db/h2"
ip="0.0.0.0"
tcp_port="64000"
web_port="8082"

java -Dh2.bindAddress=$ip \
-cp "$dir/h2-1.4.192.jar:$H2DRIVERS:$CLASSPATH" \
org.h2.tools.Server \
-baseDir $dir/db \
-tcp \
-web \
-webAllowOthers \
-tcpAllowOthers \
-tcpPort $tcp_port \
-webPort $web_port
```

Web console is available here:

`http://localhost:8082/`

Example of the url:

`spring.datasource.url=jdbc:h2:tcp://localhost:64000/dev_h2`
