FROM ubuntu:xenial
MAINTAINER Tõnis Ormisson <tonis@andmemasin.eu>


# Installing dependencies of LinPhone
RUN DEBIAN_FRONTEND=noninteractive apt-get update &&  \
    apt-get -y install \
        software-properties-common \
        python-software-properties \
        python-requests

# Installing LinPhone
RUN DEBIAN_FRONTEND=noninteractive  add-apt-repository ppa:linphone/release && \
    apt-get update && \
    ## NB! there were problems with running on 3.9.1 so downgraded to 3.6
    apt-get -y install linphone=3.6.1-2.5 liblinphone5 linphone-nogtk=3.6.1-2.5

# install locales
RUN DEBIAN_FRONTEND=noninteractive apt-get update && apt-get -y install locales

# install some ne tworking tools
RUN DEBIAN_FRONTEND=noninteractive apt -y install iputils-ping inetutils-traceroute net-tools telnet wget


# install PIP
RUN DEBIAN_FRONTEND=noninteractive apt-get -y install python3-pip

# install colored logs
RUN pip3 install coloredlogs
RUN coloredlogs --demo

# install PIPenv
RUN pip3 install pipenv

# fix locales
ENV LC_ALL=C.UTF-8
ENV LANG=de_DE.utf-8

# install requests
RUN cd /tmp && pipenv install  requests
RUN cd /tmp && pip3 install requests
RUN apt -y install nano screen


# install alsa
RUN apt install -y libasound2 libasound2-plugins alsa-utils alsa-oss

# install pulseaudio
RUN apt install -y pulseaudio pulseaudio-utils

# create a non-privileged user
RUN useradd --create-home -s /bin/bash user
WORKDIR /home/user

RUN usermod -aG pulse,pulse-access user

USER user
RUN pulseaudio -D

# check audio playing
RUN aplay /usr/share/sounds/linphone/ringback.wav
CMD ["tail", "-f", "/dev/null"]