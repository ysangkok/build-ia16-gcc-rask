#!/bin/bash -ex
#wifiip=$(ip addr | awk '/inet/ && /docker0/{sub(/\/.*$/,"",$2); print $2}')
#mkdir cgi-bin || true
#cat > cgi-bin/scr.cgi <<END
##!/bin/sh
#echo -n "Content-type: application/octet-stream\r\n\r\n"
#tar c lol
#END
#chmod +x cgi-bin/scr.cgi
##screen -list | grep "No sockets"
##if ! $?; then
#screen -d -m python3 -m http.server --cgi 8000
##fi
#sleep 1
#sed -e "s/IP/$wifiip/" < Dockerfile > context/Dockerfile
docker build -t built-gcc .
#docker run -v lol:trunk:ro -it hasscript /script
docker run -v $PWD/results:/results -it built-gcc /bin/bash -c "WATCOM=/ow /open-watcom-c-linux-1.9 -i"
docker commit $(docker ps -l -q) ia16-rask-gcc
docker run -v $PWD/results:/results -it ia16-rask-gcc /bin/bash
