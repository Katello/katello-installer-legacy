class signo::params {
  if ($katello::params::auth_method == "ldap"){
    $backend = 'ldap'
  } else {
    $backend = 'katello'
  }
}