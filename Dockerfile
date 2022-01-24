# debian 11 bullseye - released august 2021
FROM debian:11-slim

ARG S6_VERSION=2.2.0.3

LABEL maintainer="Robert Schumann <rs@n-os.org>"

COPY manifest /

ENV TERM=xterm

RUN cleanupgrade
RUN cleaninstall \
    ca-certificates \
    curl \
    entr \
    gettext-base \
    git \
    lsb-release \
    vim-tiny \
    ngrep \
    procps \
    cron \
    rsyslog

# Install s6-overlay
RUN curl -sSL "https://github.com/just-containers/s6-overlay/releases/download/v${S6_VERSION}/s6-overlay-amd64.tar.gz" \
    | tar xvzf - -C /
RUN sed -i "s/s6-nuke -th/s6-nuke -t/" /etc/s6/init/init-stage3

# Configure services
RUN touch /var/log/messages \
    && chmod 600 /etc/crontab \
    && rm -f /etc/cron.daily/apt /etc/cron.daily/dpkg /etc/cron.daily/passwd

# Run s6 service supervisor (not as entrypoint!)
CMD [ "/init" ]
