FROM ubuntu:10.04
#either RUN svn checkout svn://gcc.gnu.org/svn/gcc/trunk@127913
#COPY ia16.patch ia16.patch
#RUN patch -p0 < ia16.patch
RUN apt-get update && apt-get -y install gcc-4.1 libmpc-dev flex patch wget make
#RUN mkdir trunk; cd trunk; wget -O - http://172.17.42.1:8000/cgi-bin/scr.cgi | tar x
RUN wget --no-check-certificate http://github.com/crtc-demos/build-ia16/archive/master.tar.gz
RUN mkdir trunk; cd trunk; tar xf ../master.tar.gz
RUN cd trunk/build-ia16-master; wget --no-check-certificate -O - http://github.com/crtc-demos/newlib-ia16/archive/ia16-port.tar.gz | gunzip | tar x; mv newlib-ia16-ia16-port newlib-ia16
RUN cd trunk/build-ia16-master; wget --no-check-certificate -O - http://github.com/crtc-demos/gcc-ia16/archive/ia16-port.tar.gz | gunzip | tar x; mv gcc-ia16-ia16-port gcc-ia16
RUN cd trunk/build-ia16-master; CC=gcc-4.1 bash ./build.sh mklinks
RUN wget ftp://ftp.heanet.ie/pub/openwatcom/open-watcom-c-linux-1.9
RUN chmod +x /open-watcom-c-linux-1.9
#RUN script -c "/bin/bash -c 'WATCOM=/ow /open-watcom-c-linux-1.9 -i'" /dev/null
#RUN python -c 'import pty, sys; pty.spawn(sys.argv[1:])' /bin/bash -c "WATCOM=/ow /open-watcom-c-linux-1.9 -s"
