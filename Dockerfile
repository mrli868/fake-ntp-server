FROM debian:bullseye

RUN apt update && apt install -y ntp libfaketime && \
    ln -s /usr/lib/x86_64-linux-gnu/faketime/libfaketime.so.1 /usr/local/lib/libfaketime.so.1 && \
    echo "/usr/local/lib/libfaketime.so.1" > /etc/ld.so.preload && \
    rm -rf /var/lib/apt/lists/*

ENV FAKETIME="+2h"

CMD ["ntpd", "-n", "-g"]
