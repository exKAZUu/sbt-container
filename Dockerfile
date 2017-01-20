FROM ubuntu:16.10
MAINTAINER Kazunori Sakamoto

RUN free -m

RUN apt update \
  && apt install -y curl wget zip unzip bc \
  && apt clean -y \
  && adduser --disabled-password --gecos "" aicomp

USER aicomp
    
RUN curl -s https://get.sdkman.io | bash \
  && echo "-Xms512M -Xmx1G" >> ~/.sbtopts \
  && bash -l -c "yes | sdk install java" \
  && bash -l -c "sdk install sbt 0.13.12" \
  && bash -l -c "SBT_OPTS='-Xms4G -Xmx4G' sbt about -mem 1536" \
  && rm -Rf /home/aicomp/.sdkman/archives/* /home/aicomp/.sdkman/tmp/*
