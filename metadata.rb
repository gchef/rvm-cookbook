maintainer        "Paper Cavalier"
maintainer_email  "code@papercavalier.com"
license           "Apache 2.0"
description       "Installs RVM system-wide"
long_description  IO.read(File.join(File.dirname(__FILE__), 'README.md'))

recipe "rvm", "Installs RVM system-wide"

depends "git"
