FROM ubuntu:noble

# Install dependencies
RUN apt-get update && apt-get install -y curl bash

WORKDIR /apps

RUN curl -sSf https://cli.nexus.xyz/ -o install.sh
RUN chmod +x install.sh
RUN NONINTERACTIVE=1 ./install.sh

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
