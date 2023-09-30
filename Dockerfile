FROM alpine:latest
LABEL maintainer="stkl"
#WORKDIR /
ENV CFG_DIR=/etc
COPY ./entrypoint.sh /
RUN apk add --no-cache tzdata bird=2.13.1-r0
ENV TZ=Asia/Yekaterinburg
RUN ln -fs /usr/share/zoneinfo/Asia/Yekaterinburg /etc/localtime
ENTRYPOINT [ "/entrypoint.sh" ]
