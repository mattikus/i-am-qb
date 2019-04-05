FROM docker.io/library/ruby:2-stretch
RUN apt-get update && apt-get install -y git

ADD ./entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/bin/bash", "/entrypoint.sh"]
