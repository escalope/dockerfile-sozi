FROM node:slim
MAINTAINER Jorge J. Gomez-Sanz <jjgomez@ucm.es>
RUN \
  apt-get update && \
  # Install packages needed to enable an extra repository.
  DEBIAN_FRONTEND=noninteractive apt-get -y install software-properties-common  &&\
  DEBIAN_FRONTEND=noninteractive   apt-get update &&\
  DEBIAN_FRONTEND=noninteractive \
    apt-get -y install \
      git \
      vim \
      inkscape \	
      wget \
      gnupg 
      
RUN DEBIAN_FRONTEND=noninteractive apt-get -y install curl software-properties-common  
RUN apt-get install -y nodejs nodejs-legacy

RUN mkdir /home/inkscape
WORKDIR /home/inkscape

RUN DEBIAN_FRONTEND=noninteractive apt-get -y install wine 
RUN DEBIAN_FRONTEND=noninteractive npm install bower grunt-cli -g

#Installs one of the prebuilt images
RUN DEBIAN_FRONTEND=noninteractive apt-get -y install libgconf-2-4 libxss1
RUN cd /home/inkscape/
RUN wget -c "https://github.com/senshu/Sozi/releases/download/v18.04/sozi_18.04-1523042682_amd64.deb"
RUN dpkg -i /home/inkscape/sozi_18.04-1523042682_amd64.deb


# install from git repo does not work. It triggers a "ECONFLICT Unable to find suitable version for webcomponentsjs"
#RUN git clone git://github.com/senshu/Sozi.git /home/inkscape/Sozi
#RUN cd /home/inkscape/Sozi
#RUN npm install
# Just a "bower install" does not work
#RUN bower --allow-root install bower.json

