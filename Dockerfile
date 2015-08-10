FROM ubuntu:14.04
ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update && \
    apt-get -y install software-properties-common && \
    add-apt-repository ppa:webupd8team/java && \
    apt-get update && \
    echo oracle-java8-installer shared/accepted-oracle-license-v1-1 select true | /usr/bin/debconf-set-selections && \
    apt-get -y install oracle-java8-installer && \
    apt-get clean && \
    apt-get purge && \
    rm /var/cache/oracle-jdk8-installer/jdk-8u*-linux-x64.tar.gz && \
    update-alternatives --display java && \
    echo "JAVA_HOME=/usr/lib/jvm/java-8-oracle" >> /etc/environment

ENV       DEBIAN_FRONTEND noninteractive

ENV   JMETER_VERSION  2.13
ENV   JMETER_HOME  /opt/jmeter
ENV   JMETER_DOWNLOAD_URL  http://mirror.serversupportforum.de/apache/jmeter/binaries/apache-jmeter-${JMETER_VERSION}.tgz

# install needed debian packages & clean up
RUN apt-get update && \
    apt-get install -y --no-install-recommends curl tar ca-certificates unzip && \
    apt-get clean autoclean && \
    apt-get autoremove --yes && \
    rm -rf /var/lib/{apt,dpkg,cache,log}/

# download and extract jmeter
RUN mkdir -p ${JMETER_HOME} && \
    curl -L --silent ${JMETER_DOWNLOAD_URL} | tar -xz --strip=1 -C ${JMETER_HOME}

WORKDIR   ${JMETER_HOME}
