class profile::k8s_master_install {

  file { "/root/k8s-master-init-kubelet.sh":
    mode => '0744',
    owner => root,
    group => root,
    source => "puppet:///modules/profile/k8s-master-init-kubelet.sh"
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
    command => '/opt/puppetlabs/bin/puppet agent --onetime --no-daemonize --splay --splaylimit 1m',
    user    => 'root',
    minute  => 0,
  }

}
