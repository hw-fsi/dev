FROM ubuntu:22.04
COPY build.sh /root/build.sh
RUN /root/build.sh

COPY build-gcc.sh /root/build-gcc.sh
RUN /root/build-gcc.sh

# zsh and tmux
COPY .zshrc.tmp /root/.zshrc.tmp
COPY .tmux.conf.tmp /root/.tmux.conf.tmp
COPY .tmux.conf.local.tmp /root/.tmux.conf.local.tmp

COPY build-dev-tools.sh /root/build-dev-tools.sh
RUN /root/build-dev-tools.sh

# emacs
COPY build-emacs.sh /root/build-emacs.sh
RUN /root/build-emacs.sh

# nodejs
COPY build-nodejs.sh /root/build-nodejs.sh
RUN /root/build-nodejs.sh

# python
COPY build-python.sh /root/build-python.sh
RUN /root/build-python.sh

# rust
COPY build-rust.sh /root/build-rust.sh
RUN /root/build-rust.sh

# doom eamcs
COPY *.el /root/
COPY build-doom.sh /root/build-doom.sh
RUN /root/build-doom.sh

# clear
RUN cd && rm *.sh
