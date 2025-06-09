ARG ALPINE_VERSION
FROM alpine:${ALPINE_VERSION} AS alpine

ARG POSTGRES_VERSION
# Enable community repo (needed for postgresql16-client)
RUN echo "https://dl-cdn.alpinelinux.org/alpine/v${ALPINE_VERSION}/community" >> /etc/apk/repositories \
    && apk add --no-cache "postgresql${POSTGRES_VERSION}-client" aws-cli
WORKDIR /scripts

COPY backup.sh .
ENTRYPOINT [ "sh", "backup.sh" ]
