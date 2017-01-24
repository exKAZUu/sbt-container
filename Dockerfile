FROM ubuntu:16.10
MAINTAINER Kazunori Sakamoto

RUN free -m

RUN apt update \
  && apt install -y build-essential curl wget zip unzip bc git less \
  && apt install -y \
    clang \
    clisp \
    erlang \
    gauche \
    gdc \
    ghc \
    gnu-smalltalk \
    golang \
    ldc \
    llvm \
    lua5.3 \
    make \
    mono-complete \
    mono-dmcs \
    mono-xbuild \
    nodejs \
    ocaml-nox \
    python \
    python3 \
    perl \
    php \
    swi-prolog \
    ruby \
    rustc \
  && apt clean -y \
  && adduser --disabled-password --gecos "" aicomp

USER aicomp
    
RUN curl -s https://get.sdkman.io | bash \
  && echo "-Xms1G -Xmx4G" >> /home/aicomp/.sbtopts \
  && bash -l -c "yes | sdk install java" \
  && bash -l -c "sdk install sbt" \
  && bash -l -c "SBT_OPTS='-Xms1G -Xmx4G' sbt about" \
  && rm -Rf /home/aicomp/.sdkman/archives/* /home/aicomp/.sdkman/tmp/*
