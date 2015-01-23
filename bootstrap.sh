#!/usr/bin/env bash

curl -sSL https://get.docker.com/ubuntu/ | sudo sh

apt-get install -y python-pip
pip install -U fig

apt-get remove -y --purge puppet puppet-common chef chef-zero
apt-get autoremove -y

DOCKER_IP="$(ifconfig docker0 | awk -F ' *|:' '/inet addr/{print $4}')"
sed -i "s/#DOCKER_OPTS=\"--dns 8.8.8.8 --dns 8.8.4.4\"/DOCKER_OPTS=\"--dns ${DOCKER_IP} --dns 8.8.8.8 --dns-search service.consul\"/" /etc/default/docker
service docker restart

NODE_IP="$(ifconfig eth1 | awk -F ' *|:' '/inet addr/{print $4}')"
sed -i -e "s#{{HOSTNAME}}#$HOSTNAME#g" -e "s#{{NODE_IP}}#$NODE_IP#g" /home/vagrant/${HOSTNAME}/fig.yml

exit 0
