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
RUN DEBIAN_FRONTEND=noninteractive apt-get -y install libgconf-2-4 libxss1 unzip
RUN cd /home/inkscape/
RUN wget -c "https://github.com/senshu/Sozi/releases/download/v18.04/sozi_18.04-1523042682_amd64.deb"
RUN dpkg -i /home/inkscape/sozi_18.04-1523042682_amd64.deb

# install sozi media extensions for inkscape
RUN cd /home/inkscape
RUN wget https://github.com/senshu/Sozi/releases/download/v18.04/Sozi-extras-media-18.04-1523042682.zip
RUN unzip Sozi-extras-media-18.04-1523042682.zip
RUN mv sozi_extras_media.inx /usr/share/inkscape/extensions
RUN mv sozi_extras_media.py /usr/share/inkscape/extensions


# install from git repo does not work. It triggers a "ECONFLICT Unable to find suitable version for webcomponentsjs"
#RUN git clone git://github.com/senshu/Sozi.git /home/inkscape/Sozi
#RUN cd /home/inkscape/Sozi
#RUN npm install
# Just a "bower install" does not work
#RUN bower --allow-root install bower.json

# install the export sozi presentations to pdf, pptx or video
RUN DEBIAN_FRONTEND=noninteractive apt -y install texlive-extra-utils libav-tools
RUN DEBIAN_FRONTEND=noninteractive npm install -g sozi-export --unsafe-perm

