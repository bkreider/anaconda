class anaconda::params {
    
    $base_url = $::domain ? {
        'atx.continuum.io'=>"http://filer.atx.continuum.io/released/1.5.0",
        default           =>"http://09c8d0b2229f813c1b93-c95ac804525aac4b6dba79b00b39d1d3.r79.cf1.rackcdn.com",
    }

    $installer = $::kernel ? {
        /(L|l)inux/   => "Anaconda-1.5.0-Linux-x86_64.sh",
        'windows' => "Anaconda-1.5.0-Windows-x86_64.exe",
        'Darwin'  => "Anaconda-1.5.1-MacOSX-x86_64.sh",
    }

    $url = "${base_url}/${installer}"
}
