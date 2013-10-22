class qpid::service {
  if $::operatingsystem == 'Fedora' {
    $packages_qpid_server = "qpid-cpp-server"
  }
  else {
    $packages_qpid_server = "qpid-cpp-server-ssl"
  }

  service {"qpidd":
    ensure => running,
    enable => true,
    hasstatus => true,
    hasrestart => true,
    require => [
      Class["qpid::config"],
      Package[$packages_qpid_server],
      Class["certs::config"]
    ]
  }
}
