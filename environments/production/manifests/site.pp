node default {
  include role
}

node 'nfs-server' {
  include role::nfs_server
}
