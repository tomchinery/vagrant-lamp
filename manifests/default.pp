exec {  "apt-get update":

  path => "/usr/bin",

}

# Ensure apache is installed and running
class apache {
  package { 'apache2':
    name => 'apache2-mpm-prefork', # httpd if CentOS
    ensure => installed,
  }

  service { 'apache2':
    ensure  => running,
    require => Package['apache2'],
  }
}

# Ensure php is installed and present
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

# Ensure mysql is installed and running
class mysql {
  package { "mysql-server":
    ensure => present,
  }

  service { "mysql":
    ensure => running,
    require => Package["mysql-server"],
  }

  # Set the root password here
  exec { 'set-mysql-password':
    environment => "HOME=/root",
    command => "mysqladmin -uroot password Timtom59",
    path    => ['/bin', '/usr/bin'],
    returns => [0, 1],
    require => Service['mysql'];
  }

}

# Include puppet modules
include apache
include php
include mysql

# Sync 'www' folder to default apache path
file { '/var/www':
  ensure  => 'link',
  target  => '/vagrant/www',
  force   => true,
  replace => true,
}
