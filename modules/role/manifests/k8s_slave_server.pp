class role::k8s_slave_server {
  require profile::docker_install
  require profile::k8s_base_install
  include profile::k8s_slave_join_command

  Class['profile::docker_install']
  -> Class['profile::k8s_base_install'] 
  -> Class['profile::k8s_slave_join_command']

}
