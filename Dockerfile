#
# Ubuntu Dockerfile
#
# https://github.com/dockerfile/ubuntu
#

# Pull base image.
FROM ubuntu:16.04

# Install.
RUN \
  sed -i 's/# \(.*multiverse$\)/\1/g' /etc/apt/sources.list && \
  apt-get update && \
  apt-get -y upgrade && \
  apt-get install -y build-essential && \
  apt-get install -y software-properties-common && \
  apt-get install -y byobu curl git htop man unzip vim wget && \
  rm -rf /var/lib/apt/lists/*

# Add files.
ADD root/.bashrc /root/.bashrc
ADD root/.gitconfig /root/.gitconfig
#ADD root/.scripts /root/.scripts

# Get some useful scripts from Github
RUN mkdir -p /root/.scripts
RUN wget https://raw.githubusercontent.com/git/git/master/contrib/completion/git-completion.bash -q -O /root/.scripts/git-completion.sh
RUN wget https://raw.githubusercontent.com/git/git/master/contrib/completion/git-prompt.sh -q -O /root/.scripts/git-prompt.sh
RUN wget https://raw.githubusercontent.com/rupa/z/master/z.sh -q -O /root/.scripts/z.sh

# Set environment variables.
ENV HOME /root

# Define working directory.
WORKDIR /root



# Define default command.
CMD ["bash"]
