# Class: ruby
#
# This class installs the ruby package
#
# Parameters:
#
#  ensure: (default latest)
#    Determine the state of the packages
#
# Actions:
#   - Installs the ruby package
#
# Sample Usage:
#
#  For a standard installation, use:
#
#    class { 'ruby':
#      ensure => 'latest'
#    }
#
class ruby (
  $ensure = $::ruby::params::ruby_package_ensure
) inherits ::ruby::params {
  package { $::ruby::params::ruby_packages:
    ensure => $ensure,
  }

  case $::operatingsystem {
    'Amazon', 'Debian': {
      ruby::gems{ $::ruby::params::ruby_gems:
        ensure => $ensure,
      }
    }
  }

  $gems = hiera_hash('ruby::gems',{})
  create_resources('ruby::gems',$gems)

}
