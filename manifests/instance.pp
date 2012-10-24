define sunjdk::instance($jdk_version, $ensure='present', $install_options=undef) {
  if ! $jdk_version {
    $jdk_version = 'latest'
  } else {
    $real_jdk_version = $jdk_version
  }

  case $::operatingsystem {
    redhat, centos: {
      sunjdk::redhat { $name:
        ensure      => $ensure,
        jdk_version => $jdk_version
      }
    }
    ubuntu: {
      sunjdk::ubuntu { $name:
        jdk_version => $jdk_version
      }
    }
    windows: {
      sunjdk::windows { $name:
        ensure          => $ensure,
        jdk_version     => $jdk_version,
        install_options => $install_options
      }
    }
    default: {}
  }
}

