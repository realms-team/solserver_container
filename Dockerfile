FROM debian:stretch
MAINTAINER keoma "contact@kbl.netlib.re"

ENV DEBIAN_FRONTEND noninteractive
ENV LC_ALL C

# DEPENDENCIES

RUN apt-get update --quiet \
 && apt-get install -y wget python-pip \
 && apt-get install -y adduser libfontconfig

# SOLSERVER

RUN wget https://github.com/realms-team/solserver/archive/REL-1.3.0.0.tar.gz
RUN tar xf REL-1.3.0.0.tar.gz

RUN mv solserver-REL-1.3.0.0 solserver
RUN pip install -r solserver/requirements.txt

# INFLUXDB

RUN wget https://dl.influxdata.com/influxdb/releases/influxdb_1.5.4_amd64.deb
RUN dpkg -i influxdb_1.5.4_amd64.deb

# GRAFANA

RUN wget https://s3-us-west-2.amazonaws.com/grafana-releases/release/grafana_5.1.4_amd64.deb
RUN dpkg -i grafana_5.1.4_amd64.deb
