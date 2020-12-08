FROM opensuse/tumbleweed

RUN zypper --gpg-auto-import-keys refresh
RUN zypper install -y openssh vim iputils

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
