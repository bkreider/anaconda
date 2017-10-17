class anaconda::params {

    $base_url = $::domain ? {
      #'atx.continuum.io'=>"http://filer.atx.continuum.io/released/1.5.0",
      default           =>"http://repo.continuum.io/archive",
    }

    $installer = $::kernel ? {
      /(L|l)inux/ => "Anaconda3-4.4.0-Linux-x86_64.sh",
      'windows'   => "Anaconda-4.4.0-Windows-x86_64.exe",
      'Darwin'    => "Anaconda3-4.4.0-MacOSX-x86_64.sh",
    }
    #TODO: add support for other versions

    $url = "${base_url}/${installer}"
}


