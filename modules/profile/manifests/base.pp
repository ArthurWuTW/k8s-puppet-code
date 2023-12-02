class profile::base {
  require profile::docker_install

  $kube_packages = ['kubelet', 'kubeadm', 'kubectl']

  service { 'Service Docker...':
    ensure => running,
    name   => 'docker',
    enable => true,
  }

  service { 'Service Firewalld...':
    ensure => stopped,
    name   => 'firewalld',
    enable => false
  }

  file { '/etc/yum.repos.d/kubernetes.repo':
    mode  => '0744',
    owner => root,
    group => root,
    source => "puppet:///modules/profile/kubernetes.repo"
  } -> package { $kube_packages:
    ensure => installed,
    require => File['/etc/yum.repos.d/kubernetes.repo']
  }

}
