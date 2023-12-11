class profile::k8s_slave_join_command {
  $master_node = query_resources(false, 'Class["role::k8s_master_server"]', false).map |Hash $resource| {
    $resource['certname']
  }[0]
  if $master_node != undef {

    $command = query_facts("", ['join_command'])["${master_node}"]['join_command']

#    notify {"====== k8s_slave_join_command: ${command} ======":
#      loglevel => debug,
#    }

    file { '/root/JOIN_FLAG':
      ensure => 'present',
      content => 'join_command_flag',
      owner => 'root',
      group => 'root',
      mode => '0600',
    }
    -> file { "/root/k8s-slave-init.sh":
      mode => '0744',
      owner => root,
      group => root,
      source => "puppet:///modules/profile/k8s-slave-init.sh"
    }
    -> exec { 'JOIN Command...':
      command     => "/root/k8s-slave-init.sh && /usr/bin/${command}",
      subscribe   => File['/root/JOIN_FLAG'],
      refreshonly => true,
    }

  } else {

    notify {"====== No K8s Master found! ======":
      loglevel => err,
    }
  }

  cron { 'puppet agent':
    command => '/opt/puppetlabs/bin/puppet agent --onetime --no-daemonize --splay --splaylimit 59m',
    user    => 'root',
    minute  => 0,
  }
}
