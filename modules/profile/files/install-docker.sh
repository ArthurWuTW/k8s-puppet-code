yum install -y yum-utils device-mapper-persistent-data lvm2
yum-config-manager --add-repo \
  http://mirrors.aliyun.com/docker-ce/linux/centos/docker-ce.repo -y
yum install -y docker-ce docker-ce-cli containerd.io --allowerasing
