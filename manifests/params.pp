# Class: ruby::params
#
# This class set parameters used in this module
#
# Actions:
#   - Defines numerous parameters used by other classes
#   - Does not support other osfamily patterns - redhat only
#
class ruby::params {
  $ruby_package_ensure = 'present'

  case $::osfamily {
    'Debian': {
      $ruby_packages = [
        'ruby',
        'ruby-dev'
      ]
    }
    'RedHat': {
      $ruby_packages = [
        'ruby',
        'ruby-devel',
        'rubygem-bundler',
        'rubygems'
      ]
    }
    default: {
      fail("The ${module_name} module is not supported on an ${::osfamily} based system.")
    }
  }

}
