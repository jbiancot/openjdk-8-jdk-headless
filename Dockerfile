FROM ubuntu:16.04
MAINTAINER Jesus Bianco <jbiancot@gmail.com> 
ENV DEBIAN_FRONTEND noninteractive
ENV LANGUAGE en_US.UTF-8
ENV LANG en_US.UTF-8
ENV LC_ALL en_US.UTF-8

RUN DEBIAN_FRONTEND=noninteractive 
 
RUN apt-get -qq update
RUN apt-get -qq upgrade
RUN apt-get -qq dist-upgrade
RUN apt-get -qq autoremove
RUN apt-get -qq -y install --no-install-recommends apt-utils

RUN apt-get -y install software-properties-common python-software-properties
RUN apt-get -y install unzip
RUN apt-get -y install nano
RUN apt-get -y install lsof
RUN apt-get -y install wget
#RUN apt-get -y install mysql-client		392MB  ->  459MB

RUN apt-get -qq -y install aptitude
RUN aptitude install locales

ENV LANGUAGE en_US.UTF-8
ENV LANG en_US.UTF-8
ENV LC_ALL en_US.UTF-8

RUN locale-gen en_US en_US.UTF-8
RUN dpkg-reconfigure locales 

RUN apt-get -qq -y install inetutils-ping
RUN apt-get -qq -y install telnet

RUN apt-get -qq -y install dialog
RUN apt-get -qq -y install net-tools	##  To have tools like: netstat

RUN \
 echo oracle-java8-installer shared/accepted-oracle-license-v1-1 select true | debconf-set-selections && \
 add-apt-repository -y ppa:webupd8team/java && \
 apt-get update && \
 apt-get install -y openjdk-8-jdk-headless && \
 rm -rf /var/cache/oracle-jdk8-installer

RUN wget -q https://services.gradle.org/distributions/gradle-4.10-bin.zip \
    && unzip gradle-4.10-bin.zip -d /opt \
    && rm gradle-4.10-bin.zip

ENV GRADLE_HOME /opt/gradle-4.10
ENV PATH $PATH:/opt/gradle-4.10/bin

RUN apt-get clean all

RUN apt-get -qq clean
RUN apt-get -qq autoclean
RUN apt-get -qq autoremove

ADD bash_profile /root/.bash_profile

#####  EOF - TRON.