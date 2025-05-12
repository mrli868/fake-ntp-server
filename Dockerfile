FROM debian:bullseye

RUN apt update && apt install -y ntp libfaketime && \
    rm -rf /var/lib/apt/lists/*

ENV FAKETIME="+2h"

CMD ["faketime", "+2h", "ntpd", "-n", "-g"]
