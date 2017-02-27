FROM ubuntu:latest
MAINTAINER "Phillip Shipley" <phillip_shipley@sil.org>

ENV REFRESHED_AT 2017-02-27

RUN apt-get update -y \
    && apt-get upgrade -y \
    && apt-get install -y curl \
    && apt-get clean

# Install s3-expand into path
RUN curl -o /usr/local/bin/s3-expand https://raw.githubusercontent.com/silinternational/s3-expand/master/expand.sh \
    && chmod a+x /usr/local/bin/s3-expand
