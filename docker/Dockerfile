FROM ubuntu:18.04

# install all basic packages
RUN apt-get update \
    && apt-get upgrade -y \
    && apt-get install -y --no-install-recommends \
        ca-certificates \
        software-properties-common \
        locales \
        sudo \
        openssh-server \
    && apt-get clean \
    && apt-get autoclean \
    && apt-get autoremove \
    && rm -rf /var/lib/apt/lists/* \
    && locale-gen en_US.UTF-8
ENV LANG=en_US.UTF-8

# install ansible
RUN apt-add-repository ppa:ansible/ansible -y \
    && apt-get update \
    && apt-get install -y --no-install-recommends \
         ansible \
    && apt-get clean \
    && apt-get autoclean \
    && apt-get autoremove \
    && rm -rf /var/lib/apt/lists/*

# create user
ARG user=tester
ARG group=tester
ARG uid=1000
ARG gid=1000
RUN groupadd -o -g ${gid} ${group} \
    && useradd --no-log-init -d "/home/${user}" -u ${uid} -g ${gid} -m -s /bin/bash ${user}

# make sudo not use a password
RUN echo "${user} ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers

# run SSH server
RUN mkdir /var/run/sshd
EXPOSE 22
CMD ["/usr/sbin/sshd", "-D"]
