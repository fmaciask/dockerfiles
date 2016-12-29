FROM alpine:latest
MAINTAINER Forlidar

# This is a image that runs the script hosted inside the path ./scripts/
# Can select the script by setting the proper ENV when you call the container
RUN apk add --update bash vim && rm -rf /var/cache/apk/*
VOLUME ["files"]
COPY ./files/script.sh script.sh
RUN chmod +x script.sh

CMD ["/bin/bash","script.sh"]
