class role::k8s_master_server inherits role {
  include profile::k8s_master_install
}
