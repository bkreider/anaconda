Anaconda Puppet Module
========

Puppet module for installing anaconda, managing environments, and installing conda packages.

## Usage
(Testing on OS X and Ubuntu)

Git clone this repo into your puppet modules directory.  Then you can test it using the snippet below in a file
and running `puppet apply`. 


File: test2.pp
```puppet
# Install anaconda into /opt/anaconda
include anaconda

# Create env named test1 with python3.3
anaconda::env{test1:
    anaconda_version => "1.4",
    python           => "3.3",
    numpy            => "1.7",
}

# Create env named test2 - /opt/anaconda/envs/test2
# Use python in /opt/anaconda/envs/test2/bin/python
anaconda::env{test2:}  

# Install packages into root env
anaconda::package{dnspython: }

# Install packages into env test2
anaconda::package{dnspython: env => "test2" }

# The env test2 is a dependency when installing packages into it
# Install a number of packages into test2
anaconda::env{test2:}
anaconda::package{[dnspython,rope, py]: 
    env => "test2"
}

```

Run using this command where --modulepath points to the directory where you have installed this puppet module:
```
puppet apply modules/anaconda/test2.pp --modulepath=modules
```

### Anaconda class
This class simply installs Anaconda into /opt/anaconda and accepts the license agreement.  The path is
hardcoded for now.

### anaconda::env
```
define anaconda::env( $anaconda_version='1.5', $numpy='1.7', $python='2.7')
```
Create a Python environment.  Overriding the anaconda_version, numpy, or python version will create the env 
with the appropriate versions.

### anaconda::package
In future versions, this could be a true package provider, but for now it is just a defined type.

```
define anaconda::package( $env=undef, $base_path='/opt/anaconda')
...
anaconda::env{"test2":}
anaconda::package{[dnspython,rope, py]: 
    env => "test2"
}
```
If you set the env, you create a dependency on a anaconda::env type that matchs the env.  It will not auto-create
the environment if you forget the dependency.

## Things to Improve
* Create a true package provider
* Allow installation path to be defined - hard-coded to /opt/anaconda
* Packages cannot be specified with versions -- they install the latest version valid in the env.
