
group { "puppet":
ensure => "present",
}

File { owner => 0, group => 0, mode => 0644 }

file { '/etc/motd':
content => "Welcome to your Vagrant-built virtual machine!
            Managed by Puppet.\n"
}
file { '/home/vagrant/.vimrc':
    owner   => 'vagrant',
    group   => 'vagrant',
    content => ":set tabstop=4
:set shiftwidth=4
:set expandtab
"
}

package { 'bundler':
    ensure   => 'installed',
    provider => 'gem',
}

# Use puppet-lint for checking modules
#package { 'puppet-lint':
#    ensure   => 'installed',
#    provider => 'gem',
#}

# Testing gems
#package { ['rspec', 'mocha', 'rspec-puppet', 'puppetlabs_spec_helper']:
#    ensure   => 'installed',
#    provider => 'gem',
#}
