FROM isdnetworks/centos:8-ko
LABEL maintainer="is:-D Networks Docker Maintainers <jhcheong@isdnetworks.pe.kr>"

COPY core-geth-alltools-linux-v1.11.21.zip /usr/local/core-geth-alltools-linux-v1.11.21/
WORKDIR /usr/local/core-geth-alltools-linux-v1.11.21
RUN dnf install -y unzip \
 && dnf clean all \
 && rm -rf /var/cache/dnf \
 && unzip core-geth-alltools-linux-v1.11.21.zip \
 && rm core-geth-alltools-linux-v1.11.21.zip \
 && chown -R 0:0 . \
 && cp * /usr/bin \
 && cd .. \
 && rm -rf core-geth-alltools-linux-v1.11.21 \
 && useradd -m -s /bin/bash -u 1000 ethereum

WORKDIR /home/ethereum
USER ethereum
RUN mkdir .ethereum .etchash \
 && chmod 700 .ethereum .etchash

VOLUME ["/home/ethereum/.ethereum", "/home/ethereum/.etchash"]

EXPOSE 30303/tcp 30303/udp 8545/tcp 8546/tcp

STOPSIGNAL SIGINT

CMD ["geth"]

