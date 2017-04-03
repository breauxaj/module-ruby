define ruby::gems (
  $ensure = $::ruby::params::ruby_package_ensure
) {
  include ::ruby

  $required = $title

  package { $required:
    ensure   => $ensure,
    provider => 'gem',
    require  => Package[$::ruby::params::ruby_packages]
  }

}
