FROM ubuntu:16.04
MAINTAINER "Phillip Shipley" <phillip_shipley@sil.org>

ENV REFRESHED_AT 2017-02-27

RUN apt-get update -y \
    && apt-get upgrade -y \
    && apt-get install -y \
       curl \
       rsyslog \
       rsyslog-gnutls \
    && apt-get clean

# Install s3-expand into path
RUN curl -o /usr/local/bin/s3-expand https://raw.githubusercontent.com/silinternational/s3-expand/master/expand.sh \
    && chmod a+x /usr/local/bin/s3-expand

# Install runny into path
RUN curl -o /usr/local/bin/runny https://raw.githubusercontent.com/silinternational/runny/0.2/runny \
    && chmod a+x /usr/local/bin/runny

RUN rm -f /etc/rsyslog.d/*
COPY rsyslog.conf /etc/rsyslog.conf
COPY setup-logentries.sh /usr/local/bin/setup-logentries.sh