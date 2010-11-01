maintainer        "Paper Cavalier"
maintainer_email  "code@papercavalier.com"
license           "Apache 2.0"
description       "Installs and configures rvm system wide"
long_description  IO.read(File.join(File.dirname(__FILE__), 'README.textile'))
version           "0.1.2"

recipe "rvm", "Installs rvm system-wide"

depends "git"
depends "helper"
