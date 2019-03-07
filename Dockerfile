FROM balenalib/raspberry-pi2

MAINTAINER Vasyl Petrushko

RUN [ "cross-build-start" ]

RUN apt-get update
RUN apt-get install -y --no-install-recommends libusb-1.0-0-dev
RUN apt-get install -y --no-install-recommends pkg-config
RUN apt-get install -y --no-install-recommends ca-certificates
RUN apt-get install -y --no-install-recommends git-core
RUN apt-get install -y --no-install-recommends cmake
RUN apt-get install -y --no-install-recommends build-essential
RUN apt-get install -y --no-install-recommends gnuplot-x11

RUN echo 'blacklist dvb_usb_rtl28xxu' > /etc/modprobe.d/raspi-blacklist.conf

WORKDIR /

RUN git clone https://github.com/boatbod/op25.git && \
    cd op25 && \
    ./install.sh

RUN apt-get clean && \
    rm -rf /var/lib/apt/lists/*

RUN [ "cross-build-end" ]
