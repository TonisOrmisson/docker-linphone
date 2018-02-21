FROM ubuntu:xenial
MAINTAINER Tõnis Ormisson <tonis@andmemasin.eu>



# Installing dependencies of LinPhone
RUN DEBIAN_FRONTEND=noninteractive apt-get update &&  \
    apt-get -y install \
        software-properties-common \
        python-software-properties

# Installing LinPhone
RUN DEBIAN_FRONTEND=noninteractive  add-apt-repository ppa:linphone/release && \
    apt-get update && \
    ## NB! there were problems with running on 3.9.1 so downgraded to 3.6
    apt-get -y install linphone=3.6.1-2.5 liblinphone5 linphone-nogtk=3.6.1-2.5

