FROM teenooch/golang-plus:1.7.3

MAINTAINER Martin Purmann <tinu.public@generalmail.com>

RUN apt-get update && apt-get install -y --no-install-recommends \
      git \
      curl \
      ca-certificates \
      libgtk2.0-0 \
      libxtst6 \
      libnss3 \
      libgconf-2-4 \
      libasound2 \
      fakeroot \
      gconf2 \
      gconf-service \
      libcap2 \
      libnotify4 \
      libxtst6 \
      libnss3 \
      gvfs-bin \
      xdg-utils \
      python \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/* \
    && useradd -d /home/atom -m atom

ENV ATOM_VERSION v1.11.2
ENV ATOM_DOWNLOAD_URL https://github.com/atom/atom/releases/download/${ATOM_VERSION}/atom-amd64.deb

RUN curl -L "$ATOM_DOWNLOAD_URL" -o atom.deb \
  && dpkg -i atom.deb \
  && rm -f atom.deb \
  && rm -rf /var/lib/apt/lists/*

USER atom

RUN git clone --depth 1 https://github.com/teenooCH/dotfiles.git \
  && cp dotfiles/go-atom/bashrc_alias $HOME/.bashrc_alias; cp dotfiles/go-atom/bashrc $HOME/.bashrc \
  && ( cd dotfiles/atom; ./setupAtom.sh atom ) \
  && rm -rf dotfiles


CMD ["/usr/bin/atom","-f"]
