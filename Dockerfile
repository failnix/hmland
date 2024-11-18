# HMCFGUSB
# http://git.zerfleddert.de/cgi-bin/gitweb.cgi/hmcfgusb
FROM debian:buster-slim

# Package version
ARG HMCFGUSB_VER=0.103

COPY hmcfgusb-$HMCFGUSB_VER.tar.gz /tmp

# Install build packages
#RUN apk add --no-cache --virtual=build-dependencies \
#            build-base \
RUN apt-get update && apt-get install -y --no-install-recommends build-essential libusb-dev libusb-1.0-0-dev libusb-1.0-0 wget \

# Install app
 && mkdir /app \
 && tar -xzf /tmp/hmcfgusb-$HMCFGUSB_VER.tar.gz -C /app \
 && ln -s /app/hmcfgusb-$HMCFGUSB_VER /app/hmcfgusb \
 && cd /app/hmcfgusb-$HMCFGUSB_VER \
 && make \
# Cleanup
 && apt purge -y build-essential wget && apt autoremove -y \
 && rm *.h *.o *.c *.d \
 && rm /tmp/hmcfgusb-$HMCFGUSB_VER.tar.gz

WORKDIR /app/hmcfgusb

EXPOSE 1234

CMD ["/app/hmcfgusb/hmland", "-v", "-p 1234"]
