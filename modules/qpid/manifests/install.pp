class qpid::install {

  if $::operatingsystem == 'Fedora' {
    $packages_to_install = ["qpid-cpp-server","qpid-cpp-client"]
  }
  else {
    $packages_to_install = ["qpid-cpp-server","qpid-cpp-client","qpid-cpp-client-ssl","qpid-cpp-server-ssl"]
  }

  package {$packages_to_install:
    ensure => "installed",
    before => Service["qpidd"]
  } 

  package {"policycoreutils-python":
    ensure => "installed"
  } 

  file {
    "/etc/qpid":
      require => Package["qpid-cpp-server"]
  }

}

