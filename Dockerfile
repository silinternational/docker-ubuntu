FROM ubuntu:14.04
MAINTAINER "Phillip Shipley" <phillip_shipley@sil.org>

ENV REFRESHED_AT 2015-07-29

RUN apt-get update -y \
    && apt-get upgrade -y \
    && apt-get install -y curl \
    && apt-get clean

# Install s3-expand into path
RUN curl -o /usr/local/bin/s3-expand https://raw.githubusercontent.com/silinternational/s3-expand/master/expand.sh \
    && chmod a+x /usr/local/bin/s3-expand
