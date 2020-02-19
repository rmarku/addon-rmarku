ARG BUILD_FROM=hassioaddons/base:7.0.0

ARG FLEXGET_VERSION="3.1.26"

# hadolint ignore=DL3006
FROM ${BUILD_FROM}

# Copy root filesystem
COPY rootfs /

# Setup base
RUN apk add --no-cache \
    coreutils=8.31-r0 \
    wget=1.20.3-r0

# Build arguments
ARG BUILD_ARCH
ARG BUILD_DATE
ARG BUILD_REF
ARG BUILD_VERSION

# Flexget
RUN addgroup -g 101 -S flexget && \
    adduser -u 100 -S -G flexget flexget && \
    apk add --update python3 py3-pip


RUN mkdir /flexget


VOLUME /flexget

RUN pip3 install  flexget

# Labels
LABEL \
    io.hass.name="FlexGet" \
    io.hass.description="FlexGet add-on by MarkU" \
    io.hass.arch="${BUILD_ARCH}" \
    io.hass.type="addon" \
    io.hass.version=${BUILD_VERSION} \
    maintainer="Martin Marcucci <rmarku@addons.community>" \ 
    org.label-schema.description="Example add-on by Community Hass.io Add-ons" \
    org.label-schema.build-date=${BUILD_DATE} \
    org.label-schema.name="Example" \
    org.label-schema.schema-version="1.0" \
    org.label-schema.url="https://addons.community" \
    org.label-schema.usage="https://github.com/hassio-addons/addon-example/tree/master/README.md" \
    org.label-schema.vcs-ref=${BUILD_REF} \
    org.label-schema.vcs-url="https://github.com/hassio-addons/addon-example" \
    org.label-schema.vendor="Community Hass.io Addons"
