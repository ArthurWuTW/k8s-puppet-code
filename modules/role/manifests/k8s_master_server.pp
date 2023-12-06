class role::k8s_master_server inherits role {
  require profile::docker_install
  require profile::k8s_master_install

  Class['profile::docker_install'] -> Class['profile::k8s_master_install']
}
