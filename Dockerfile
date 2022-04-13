FROM debian:stretch-slim
ENV USER=firefox
ENV GUID=1000
RUN mkdir -p /src 
RUN apt-get update && apt-get upgrade -y && apt-get install -y ca-certificates apt-utils wget --no-install-recommends 
RUN apt-get install -y firefox-esr libnss3-tools openssl procps sudo --no-install-recommends 
RUN apt-get install -y python2.7 libpython2.7-minimal libpython2.7-stdlib python-openssl zenity libgtk2.0-0 pulseaudio dbus cgmanager consolekit openssh-client --no-install-recommends
RUN apt-get install -y dialog
RUN mkdir -p /home/firefox 
COPY startup.sh /home/firefox
RUN    chmod 744 /home/firefox/startup.sh \
    && groupadd -g ${GUID} -r ${USER} \
    && useradd -u ${GUID} -r -g ${USER} -G audio,video ${USER} -d /home/${USER} \
    && chown -R ${GUID}:${GUID} /home/${USER} \
    && echo 'firefox ALL=(ALL) NOPASSWD: ALL' >> /etc/sudoers \
    && echo 'Defaults !requiretty' >> /etc/sudoers \
    && apt-get purge --auto-remove -y \
    && rm -rf /var/lib/apt/lists/*
RUN service dbus start
# Run Firefox as non privileged user
USER firefox
# Autorun Firefox
CMD [ "/home/firefox/startup.sh" ]
