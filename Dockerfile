FROM centos:centos7
MAINTAINER Kevin Fox "kevin@efox.cc"

ADD ./start.sh /etc/start.sh

RUN \
  yum install -y smartmontools cronie; \
  curl -o /usr/bin/smartmon.sh https://raw.githubusercontent.com/prometheus/node_exporter/master/text_collector_examples/smartmon.sh; \
  chmod +x /usr/bin/smartmon.sh /etc/start.sh ; \
  sed -i 's/^\(.*pam_loginuid.so\)$/#\1/' /etc/pam.d/crond
  
CMD ["/etc/start.sh"]
