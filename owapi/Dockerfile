FROM debian:jessie
MAINTAINER Quinten De Swaef "info@de-swaef.eu"
RUN apt-get update && apt-get install -y wget libxslt-dev build-essential libssl-dev zlib1g-dev git sudo redis-server && apt-get clean autoclean && rm -rf /var/lib/apt
RUN wget https://www.python.org/ftp/python/3.5.3/Python-3.5.3.tgz && tar xzvf Python-3.5.3.tgz && cd Python-3.5.3 && ./configure && make && sudo make install
RUN wget https://bootstrap.pypa.io/get-pip.py && python3.5 get-pip.py
VOLUME /owapi
EXPOSE 4444
ADD initialize.sh /initialize.sh
ADD config/config.yml /owapi-config/config.yml
ENTRYPOINT ["./initialize.sh"]
