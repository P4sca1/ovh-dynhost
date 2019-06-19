FROM alpine:3.10

RUN apk add --update --no-cache curl bind-tools

WORKDIR /usr/src/app

COPY dynhost.sh .
RUN chmod +x ./dynhost.sh

RUN ln -sf /usr/src/app/dynhost.sh /etc/periodic/15min/dynhost

CMD ["crond", "-f"]
