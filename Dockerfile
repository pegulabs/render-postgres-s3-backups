ARG ALPINE_VERSION
FROM alpine:${ALPINE_VERSION} AS alpine

ARG POSTGRES_VERSION
RUN apk add --no-cache postgresql$POSTGRES_VERSION-client \
    aws-cli
WORKDIR /scripts

COPY backup.sh .
ENTRYPOINT [ "sh", "backup.sh" ]
