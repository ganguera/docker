# Proof of concept to integrate Docker, Consul and progrium/registrator

Run a three nodes Consul cluster, a couple of frontend nodes and one backend node.

Services provided:
- Consul Service Discovery
- cAdvisor
- nginx (as a reverse proxy)
- Custom app
  - Bottle app
  - Redis
- Wordpress
  - PHP Built-in web server
  - MySQL

## Requirements
- [VirtualBox](https://www.virtualbox.org/)
- [Vagrant](https://www.vagrantup.com/)
### Optional but recommended
- [Vagrant VB Guest Additions Plugin](https://github.com/dotless-de/vagrant-vbguest)

## Usage
1. Clone this repository
2. Execute ```vagrant up``` to start the six nodes
3. SSH in every node ```vagrant ssh ${HOSTNAME}```
4. From "/home/vagrant/${HOSTNAME}" execute ```sudo fig up``` to start every container
5. Modify your local "/etc/hosts"
```sudo -- sh -c "echo 172.16.10.14 app.example.com wordpress.example.com >> /etc/hosts"```

You'll find the following things at:
- Consul Console: http://172.16.10.11:8500
- cAdvisor: http://${NODE_IP}:8080
- Custom app: http://172.16.10.14:5000, http://172.16.10.15:5000
- Wordpress: http://172.16.10.15:8000
- Custom app through nginx: http://app.example.com
- Wordpress through nginx: http://wordpress.example.com
