FROM ubuntu:18.04


#Install git
RUN apt-get update \
    && apt-get install -y --no-install-recommends git
    
    
RUN cd /home/
RUn git config http.sslVerify false
RUN git clone https://github.com/Eba-M/E3DC-Control.git
RUN apt-get install -y git screen g++ build-essential
#Compile
RUN cd E3DC-Control make


WORKDIR /home/E3DC-Control
USER root
