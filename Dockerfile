#FROM ubuntu:18.04
FROM resin/armv7hf-debian-qemu
RUN [ "cross-build-start" ]

#Install git
RUN apt-get update \
    && apt-get install -y --no-install-recommends git
    
RUN git config --global http.sslVerify false
RUN git clone https://github.com/Eba-M/E3DC-Control.git
RUN git clone https://github.com/merlin2533/E3DC-Control_Docker.git

RUN apt-get install -y git screen g++ build-essential screen

#Setting Copy
RUN mv /E3DC-Control_Docker/e3dc.config.txt /E3DC-Control/e3dc.config.txt
RUN mv /E3DC-Control_Docker/E3DC_CONF.h.txt /E3DC-Control/E3DC_CONF.h

#Compile
WORKDIR /E3DC-Control 
RUN cd /E3DC-Control 
Run ls
RUN cd /E3DC-Control
RUN make
RUN cd /E3DC-Control_Docker 
Run ls
RUN chmod 777 /E3DC-Control_Docker/e3dc.sh

WORKDIR /E3DC-Control_Docker
CMD /E3DC-Control_Docker/e3dc.sh
