FROM phusion/baseimage:0.9.16

RUN apt-get update && \
    apt-get install -y \
        libgtk2.0-dev \
        libjasper-dev \
        libjpeg-dev \
        libpng-dev \
        libtiff-dev \
        python-dev \
        python-numpy \
        python-opencv \
        python-pip \
        python-pycurl \
        webp

RUN apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN pip install thumbor

COPY thumbor.conf thumbor.conf

CMD thumbor -p 8080 -c thumbor.conf

EXPOSE 8080