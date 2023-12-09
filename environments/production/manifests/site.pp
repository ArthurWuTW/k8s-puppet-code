node default {
  include role
}

node 'nfs-server' {
  include role::nfs_server
}

node 'k8s-master' {
  include role::k8s_master_server
}

node 'k8s-node1', 'k8s-node2' {
  include role::k8s_slave_server
}
