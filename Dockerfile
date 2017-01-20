FROM ubuntu:16.10
MAINTAINER Kazunori Sakamoto

RUN free -m

RUN apt update \
  && apt full-upgrade -y \
  && apt install -y curl wget zip unzip \
  && apt clean -y \
  && adduser --disabled-password --gecos "" aicomp

USER aicomp
    
RUN curl -s https://get.sdkman.io | bash \
  && bash -l -c "yes | sdk install java" \
  && bash -l -c "sdk install sbt" \
  && bash -l -c "sbt about -mem 1536" \
  && rm -Rf /home/aicomp/.sdkman/archives/* /home/aicomp/.sdkman/tmp/*
