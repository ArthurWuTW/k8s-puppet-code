yum install https://yum.puppet.com/puppet5-release-el-8.noarch.rpm -y
yum install puppet-agent -y
hostnamectl set-hostname k8s-master

vi /etc/hosts
# add this line
# 10.1.1.9 puppetdb.example.com

vi /etc/puppetlabs/puppet/puppet.conf
# add this line
# server = puppetdb.example.com

puppet agent -t
