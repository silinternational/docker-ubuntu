FROM ubuntu:latest
MAINTAINER "Phillip Shipley" <phillip_shipley@sil.org>

ENV REFRESHED_AT 2015-07-09

RUN apt-get update -y \
    && apt-get upgrade -y \
    && apt-get clean
