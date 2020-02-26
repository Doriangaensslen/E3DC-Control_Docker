FROM ubuntu:18.04


#Install git
RUN apt-get update \
    && apt-get install -y --no-install-recommends git
    
    
RUN cd /home/
RUN git config --global http.sslVerify false
RUN git clone https://github.com/Eba-M/E3DC-Control.git
RUN git clone https://github.com/merlin2533/E3DC-Control_Docker.git

RUN apt-get install -y git screen g++ build-essential screen

#Setting Copy
RUN mv /home/E3DC-Control_Docker/e3dc.config.txt /home/E3DC-Control/e3dc.config.txt
RUN mv /home/E3DC-Control_Docker/E3DC_CONF.h /home/E3DC-Control/E3DC_CONF.h

#Compile
RUN cd /home/E3DC-Control 
Run make
RUN cd /home/E3DC-Control_Docker
RUN ls
RUN chmod 777 e3dc.sh




WORKDIR /home/E3DC-Control_Docker
RUN ./e3dc.sh"
