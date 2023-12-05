class profile::install_nfs {
  include stdlib
  $nfs_packages = ['rpcbind', 'nfs-utils']

  package { $nfs_packages:
    ensure => installed,
  }

  file { '/etc/exports':
    ensure => present,
  }
  -> file_line { 'add export fs':
    path => '/etc/exports',
    line => '/opt *(rw,no_root_squash,no_subtree_check)',
  }
  -> service { 'Service Nfs-server...':
    ensure => running,
    name   => 'nfs-server',
    enable => true
  }

  service { 'Service Firewalld...':
    ensure => stopped,
    name   => 'firewalld',
    enable => false
  }

}
