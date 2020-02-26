FROM ubuntu:18.04


#Install git
RUN apt-get update \
    && apt-get install -y --no-install-recommends git
    
    
RUN cd /home/
RUn git config http.sslVerify false
RUN git clone https://github.com/Eba-M/E3DC-Control.git
RUN git clone https://github.com/merlin2533/E3DC-Control_Docker.git

RUN apt-get install -y git screen g++ build-essential screen
#Compile
RUN cd E3DC-Control make
RUN cd E3DC-Control_Docker
RUN chmod 777 E3DC.sh

WORKDIR /home/E3DC-Control_Docker
RUN su  pi -c "screen -dmS E3DC /home/pi/E3DC-Control/E3DC.sh"
USER root
