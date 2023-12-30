class profile::k8s_master_install {

  file { "/root/k8s-master-init-kubelet.sh":
    mode => '0744',
    owner => root,
    group => root,
    source => "puppet:///modules/profile/k8s-master-init-kubelet.sh"
  }
  -> file { "/root/ingress-nginx-controller-deployment-fix_v1_0_4.yaml":
    mode => '0744',
    owner => root,
    group => root,
    source => "puppet:///modules/profile/ingress-nginx-controller-deployment-fix_v1_0_4.yaml"
  }
  -> exec { 'Init Kubelet...': # "~>" execute when previous resource changes
    command     => '/root/k8s-master-init-kubelet.sh',
    subscribe   => File['/root/k8s-master-init-kubelet.sh'],
    refreshonly => true,
  }
  -> service { 'Service Kubelet...':
    ensure => running,
    name   => 'kubelet',
    enable => true,
  }

  cron { 'puppet agent':
    command => '/opt/puppetlabs/bin/puppet agent --onetime --no-daemonize --splay --splaylimit 59m',
    user    => 'root',
    minute  => 0,
  }

  file { "/root/k8s_yaml":
    ensure  => directory,
    recurse => 'remote',
    mode    => '0744',
    owner   => root,
    group   => root,
    source  => "puppet:///modules/profile/k8s_yaml"
  }

}
