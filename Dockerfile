FROM alpine:latest
LABEL maintainer="stkl"
#WORKDIR /
ENV CFG_DIR=/etc
COPY ./entrypoint.sh /
RUN apk add --no-cache tzdata bird=2.13.1-r0
ENTRYPOINT [ "/entrypoint.sh" ]
