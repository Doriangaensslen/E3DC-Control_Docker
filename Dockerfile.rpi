FROM arm32v7/node:8 as node_cache


#Install git
RUN apt-get update \        
    apt-get install -y git screen g++ build-essential
RUN mkdir /home/ \      
           cd /home/ \        
            git clone https://github.com/Eba-M/E3DC-Control.git
#Compile
RUN cd E3DC-Control make
# Restore node modules
RUN npm install

WORKDIR /home/E3DC-Control
USER root
