FROM debian:12
ENV LANG en_US.UTF-8
ENV DEBIAN_FRONTEND noninteractive
COPY xinitrc /xinitrc
COPY startxwayland /startxwayland
RUN echo "$LANG UTF-8" > /etc/locale.gen \
    && apt-get update \
    && apt-get install -y --no-install-recommends \
        debus-x11 libxvi mesa-utils meta-utils-extra psmisc procps \
        locales xauth xinit x11-xserver-utils xwayland fvwm xterm \
    && update-locale --reset LANG=$LANG \
    && chmod 0755 /startxwayland
ENTRYPOINT ["/startxwayland"]
CMD ["fvwm"]