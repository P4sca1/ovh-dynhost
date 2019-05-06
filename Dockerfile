FROM alpine:3.9

RUN apk add --update --no-cache curl bind-tools

WORKDIR /usr/src/app

COPY dynhost.sh .
RUN chmod +x ./dynhost.sh

RUN ln -s /usr/src/app/dynhost.sh /etc/periodic/15min/dynhost

CMD ["crond", "-f"]
