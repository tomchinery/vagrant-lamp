exec {  "apt-get update":

  path => "/usr/bin",

}

class apache {
  # Ensures Apache2 is installed
  package { 'apache2':
    name => 'apache2-mpm-prefork', # httpd if CentOS
    ensure => installed,
  }

  # Ensures the Apache service is running
  service { 'apache2':
    ensure  => running,
    require => Package['apache2'],
  }
}

class php {
  package { "php5":
    ensure => present,
  }

  package { "php5-cli":
    ensure => present,
  }

  package { "php5-mysql":
    ensure => present,
  }

  package { "libapache2-mod-php5":
    ensure => present,
  }
}

class mysql {
  package { "mysql-server":
    ensure => present,
  }

  service { "mysql":
    ensure => running,
    require => Package["mysql-server"],
  }

}

include apache
include php
include mysql

file { '/var/www':
  ensure  => 'link',
  target  => '/vagrant/www',
  force   => true,
  replace => true,
}
