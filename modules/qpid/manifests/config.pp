class qpid::config {
  user { 'qpidd':
        ensure => present,
        groups => ['katello']
  }

  if $::operatingsystem == 'Fedora' {
    $mechanism_option = 'ha-mechanism'
    package {"qpid-cpp-server-ha":
    ensure => installed,
    }
  }
  else {
    $mechanism_option = 'cluster-mechanism'
  }

  file { "/etc/qpidd.conf":
    content => template("qpid/etc/qpidd.conf.erb"),
    before => [Class["qpid::service"]],
    notify => Service["qpidd"]
  }

}
