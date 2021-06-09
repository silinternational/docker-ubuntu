FROM ubuntu:21.04
LABEL maintainer="matt_henderson@sil.org"

ENV REFRESHED_AT 2021-06-09

RUN apt-get update -y \
# Install some basic things
    && apt-get install -y \
       curl \
# Install locale
       locales \
# Actually set up the /etc/default/locale file to match
    && locale-gen en_US.UTF-8 \
    && update-locale LANG="en_US.UTF-8" \
    && update-locale LANGUAGE="en_US:en" \
    && update-locale LC_ALL="en_US.UTF-8"
# removing locales causes issues

# NOTE:
# Don't clean up apt cache, to avoid apt-get update bug in runc:
# https://stackoverflow.com/q/66319610

# Set up default locale environment variables
ENV LANG="en_US.UTF-8" LANGUAGE="en_US:en" LC_ALL="en_US.UTF-8"

# Install s3-expand into path
RUN curl -o /usr/local/bin/s3-expand https://raw.githubusercontent.com/silinternational/s3-expand/master/expand.sh \
    && chmod a+x /usr/local/bin/s3-expand
