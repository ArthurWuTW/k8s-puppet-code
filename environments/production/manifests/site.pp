node default {
  include role
}

node 'nfs-server' {
  include role::nfs_server
}

node 'k8s-master13' {
  include role::k8s_master_server
}
