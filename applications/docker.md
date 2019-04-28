**Docker commands**
```
docker run -d -it --name devtest --mount type=bind,source="$(pwd)"/code,target=/code csp:latest
docker exec -it $1 bash


docker run -i -t ubuntu:bionic /bin/bash
docker start -ai 522ca185547c

docker run -it ubuntu
docker ps -a
docker start -ai 522ca185547c


docker build -t csp .
docker run -d csp

docker run -v /home/igor/docker/code:/home/csp-test -it csp
docker run -v /host/directory:/container/directory -other -options image_name command_to_run
```