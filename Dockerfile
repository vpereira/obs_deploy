FROM opensuse/tumbleweed

RUN zypper ar -f -G https://download.opensuse.org/repositories/home:/vpereirabr/openSUSE_Tumbleweed/home:vpereirabr.repo
RUN zypper --gpg-auto-import-keys refresh
RUN zypper install -y openssh vim iputils
RUN zypper install -y ruby2.6-rubygem-obs_deploy

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]



