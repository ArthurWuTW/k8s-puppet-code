class profile::base {
  notify {"Hello world!":
    loglevel => debug,
  }

  file { "/root/install-docker.sh":
    owner => root,
    group => root,
    source => "puppet:///modules/profile/install-docker.sh"
  }
}
