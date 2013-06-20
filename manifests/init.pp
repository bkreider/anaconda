class anaconda {
    Exec { path => '/opt/anaconda/bin:/usr/bin:/usr/sbin/:/bin:/sbin' }
    include anaconda::install
}
