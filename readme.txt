file {  "/var/www/":

  ensure => "link",

  target => "/vagrant/www",

  require => Package["apache2"],

  notify => Service["apache2"],

}

class apache2::install {
  package { 'apache2':
    ensure => present,
  }
}
