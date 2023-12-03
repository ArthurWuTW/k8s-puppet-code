yum install https://yum.puppet.com/puppet5-release-el-8.noarch.rpm -y
yum install puppet-agent -y
hostnamectl set-hostname k8s-master1

echo "10.1.1.9 puppetdb.example.com" >> /etc/hosts

echo "server = puppetdb.example.com" >> /etc/puppetlabs/puppet/puppet.conf

puppet agent -t
