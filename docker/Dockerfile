FROM ubuntu:16.04

ENV DEBIAN_FRONTEND noninteractive
ENV DEBCONF_NONINTERACTIVE_SEEN true

RUN apt update \
      && \
        apt -y install --no-install-recommends \
          build-essential \
          git \
          vim \
          locales \
          ca-certificates \
          wget \
          patch \
          cpio \
          python \
          unzip \
          rsync \
          bc \
          bzip2 \
          ncurses-dev \
          git \
          make \
          g++ \
          file\
          flex \
          bison \
          less \
          qemu-system-sparc \
          openbios-sparc \
      && \
        apt -y autoremove \
      && \
        apt clean \
      && \
        rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN sed -i "s/^# en_US.UTF-8/en_US.UTF-8/" /etc/locale.gen && locale-gen && update-locale LANG=en_US.UTF-8

ARG uid
ARG gid
ARG user
ARG group

RUN groupadd -g ${gid} ${group}
RUN cat /etc/group
RUN useradd -u ${uid} -g ${gid} -m -d /home/dot -s /bin/bash ${user}
RUN cat /etc/group
RUN cat /etc/passwd

# prevent container from exiting; keep it alive
ENTRYPOINT ["tail", "-f", "/dev/null"]
