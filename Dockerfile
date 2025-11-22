# HMCFGUSB
# http://git.zerfleddert.de/cgi-bin/gitweb.cgi/hmcfgusb
FROM debian:bullseye-slim

# Package version
ARG HMCFGUSB_VER=0.103

# Install build packages
RUN apt-get update && apt-get install -y --no-install-recommends \
    build-essential \
    libusb-dev \
    libusb-1.0-0-dev \
    libusb-1.0-0 \
    wget && \
    wget http://git.zerfleddert.de/hmcfgusb/releases/hmcfgusb-$HMCFGUSB_VER.tar.gz -P /tmp && \
    mkdir /app && \
    tar -xzf /tmp/hmcfgusb-$HMCFGUSB_VER.tar.gz -C /app && \
    ln -s /app/hmcfgusb-$HMCFGUSB_VER /app/hmcfgusb && \
    cd /app/hmcfgusb-$HMCFGUSB_VER && \
    make && \
    apt purge -y build-essential wget && apt autoremove -y && \
    rm *.h *.o *.c *.d && \
    rm /tmp/hmcfgusb-$HMCFGUSB_VER.tar.gz

WORKDIR /app/hmcfgusb

EXPOSE 1000

CMD ["/app/hmcfgusb/hmland", "-v", "-p", "1000"]
