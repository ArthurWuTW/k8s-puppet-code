class profile::base {
  require profile::docker_install

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
}
