class profile::k8s_base_install {
  $kube_packages = ['kubelet', 'kubeadm', 'kubectl']

  file { '/etc/yum.repos.d/kubernetes.repo':
    mode  => '0744',
    owner => root,
    group => root,
    source => "puppet:///modules/profile/kubernetes.repo"
  }
  -> package { $kube_packages:
    ensure => installed,
    require => File['/etc/yum.repos.d/kubernetes.repo']
  }
  -> file { "/root/k8s-settings-before-start-kubelet.sh":
    mode => '0744',
    owner => root,
    group => root,
    source => "puppet:///modules/profile/k8s-settings-before-start-kubelet.sh"
  }
  -> exec { 'Settings before start-Kubelet...': # "~>" execute when previous resource changes
    command     => '/root/k8s-settings-before-start-kubelet.sh',
    subscribe   => File['/root/k8s-settings-before-start-kubelet.sh'],
    refreshonly => true,
  }
}
