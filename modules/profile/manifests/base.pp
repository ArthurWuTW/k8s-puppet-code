class profile::base {
  notify {"Hello world!":
    loglevel => debug,
  }

  file { "/root/install-docker.sh":
    mode => '0744',
    owner => root,
    group => root,
    source => "puppet:///modules/profile/install-docker.sh"
  }
  -> exec { 'Install Docker...':
    command     => '/root/install-docker.sh',
    subscribe   => File['/root/install-docker.sh'],
    refreshonly => true,
  }
}
