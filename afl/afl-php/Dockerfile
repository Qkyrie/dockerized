FROM debian:jessie
MAINTAINER Quinten De Swaef
RUN apt-get update && apt-get install build-essential wget libxml2-dev -y
RUN wget 'http://lcamtuf.coredump.cx/afl/releases/afl-2.10b.tgz' -O- | tar zxvf -  && cd afl-* && make PREFIX=/usr install && cd /
RUN wget 'http://be2.php.net/get/php-7.0.5.tar.gz/from/this/mirror' -O- | tar zxvf -  && cd php-7.0.5 && ./configure CC=afl-gcc CXX=afl-clang --disable-shared && make clean all install && cd /
ADD initialize.sh /initialize.sh
RUN mkdir -p /examples
COPY examples/* /examples/
RUN chmod +x /initialize.sh
VOLUME /fuzzing
ENTRYPOINT ["./initialize.sh"]
