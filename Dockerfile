ARG FROM_VERSION=latest
FROM i386/alpine:$FROM_VERSION

RUN apk add --no-cache libstdc++ libgcc libc6-compat xz libnsl \
	&& ln -s /usr/lib/libnsl.so.2.0.0 /usr/lib/libnsl.so.1

ADD build/app-bin.tar.xz /usr/local/bin

RUN addgroup -g 10001 pbx && adduser -u 10001 -D -G pbx pbx

WORKDIR /data

USER pbx

CMD ["/bin/ash"]

#ENTRYPOINT ["scomm"]
#ENTRYPOINT ["ls", "/"]
#CMD ["ls", "/usr/local/bin"]
