anaconda::env{test2:}
anaconda::package{[dnspython,rope, py]: 
    env => "test2"
}
anaconda::env{test1:
    anaconda_version => "1.4",
    python           => "3.3",
    numpy            => "1.7",
}
