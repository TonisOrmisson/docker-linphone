FROM ubuntu:xenial
ENV DEBIAN_FRONTEND teletype
MAINTAINER Tõnis Ormisson <tonis@andmemasin.eu>

# Installing dependencies of LinPhone
RUN DEBIAN_FRONTEND=noninteractive apt-get update &&  \
    apt-get -y install \
        software-properties-common \
        python-software-properties

# Installing LinPhone
RUN DEBIAN_FRONTEND=noninteractive  add-apt-repository ppa:linphone/release && \
    apt-get update && \
    apt-get -y install linphone

