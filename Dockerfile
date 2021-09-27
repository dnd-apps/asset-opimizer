FROM alpine


# Install the required packages
RUN apk add --no-cache \
    bash \
    curl \
    git \
    jq \
    make \
    openssl \
    wget \
    zip \
    zlib \
    jpegoptim \
    optipng \
    gifsicle

WORKDIR /assets

COPY ./scripts /scripts

ENTRYPOINT [ "bash", "/scripts/entrypoint.sh" ]

