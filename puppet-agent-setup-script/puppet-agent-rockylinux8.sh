yum install https://yum.puppet.com/puppet5-release-el-8.noarch.rpm -y
yum install puppet-agent -y
hostnamectl set-hostname k8s-master1

echo "10.1.1.9 puppetdb.example.com" >> /etc/hosts

echo "server = puppetdb.example.com" >> /etc/puppetlabs/puppet/puppet.conf

puppet agent -t

# if face the below error,
# FIX - This happen due to time difference between Master & Salve.

# SSL_connect returned=1 errno=0 state=error: certificate verify failed:
# [CRL is not yet valid for /CN=puppet.server.com]
chronyc -a makestep
systemctl stop chronyd
chronyd -q 'server pool.ntp.org iburst'
systemctl start chronyd
date
