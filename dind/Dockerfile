FROM alpine:latest
MAINTAINER forlidar@gmail.com

# Install the magic wrapper.
ADD ./wrapdocker /usr/local/bin/wrapdocker

# Directory where app is stored
VOLUME /app

# Install Docker and dependencies
RUN apk --update add \
  bash \
  iptables \
  ca-certificates \
  e2fsprogs \
  docker \
  && chmod +x /usr/local/bin/wrapdocker \
  && rm -rf /var/cache/apk/* \
  && mkdir /data 
#  && git clone https://github.com/fmaciask/game-of-life.git /data/gol


# VOLUME where it saves a script
VOLUME /data
# This image will contain a docker build sh script.
ADD dockerbuildandpush.sh /data/dockerbuildandpush.sh

# Health check
HEALTHCHECK --interval=5s --timeout=3s CMD curl --fail http://localhost:8091/pools || exit 1

# Define additional metadata for our image.
VOLUME /var/lib/docker
CMD ["wrapdocker"]
