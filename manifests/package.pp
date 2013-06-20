# Adds packages to an existing Conda env
# Need to add Version parameter

# Note: This can be very slow - it downloads packages from the Repo
define anaconda::package( $env=undef, $base_path='/opt/anaconda') {
    include anaconda
    
    $conda = "${base_path}/bin/conda"
        
    
    # Need environment option if env is set
    # Also requirement on the env being defined
    if $env {
        $env_option = "--name ${env}"
        $env_require = [Class["anaconda::install"], Anaconda::Env[$env] ]
        $env_name = "${env}"
    } else {
        $env_option = ''
        $env_name = "root"
        $env_require = [Class["anaconda::install"]]
    }
    
    
    exec { "anaconda_${env_name}_${name}":
        command => "${conda} install --yes --quiet ${env_option} ${name}",
        require => $env_require,
        
        # Ugly way to check if package is already installed
        # bug: conda list returns 0 no matter what so we grep output
        onlyif  => "${conda} list ${env_option} ${name} | grep -q 'no packages matching'",
    }
}