node default {
  include ::ruby

  case $::operatingsystem {
    'Amazon': {
        Package { allow_virtual => false }
    }
    default: {}
  }

  case $::osfamily {
    'Debian': {
      package { 'build-essential': ensure => present, before => Package['mailcatcher'] }
      package { 'software-properties-common': ensure => present, before => Package['mailcatcher'] }
      package { 'libsqlite3-dev': ensure => present, before => Package['mailcatcher'] }
    }
    'RedHat': {
      package { 'gcc': ensure => present, before => Package['mailcatcher'] }
      package { 'gcc-c++': ensure => present, before => Package['mailcatcher'] }
      package { 'openssl-devel': ensure => present, before => Package['mailcatcher'] }
      package { 'sqlite-devel': ensure => present, before => Package['mailcatcher'] }    
    }
    default: {}
  }

  ruby::gems { 'mailcatcher': ensure => present }

}