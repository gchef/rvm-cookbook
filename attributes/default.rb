default[:rvm_source] = "https://raw.github.com/wayneeseguin/rvm/master/binscripts/rvm-installer"
default[:rvm_path]   = "/usr/local/rvm"
default[:rvm_bin]    = "#{rvm_path}/bin/rvm"
default[:rvm_script] = "#{rvm_path}/scripts/rvm"

default[:rvm_rubies] = []
default[:rvm_global_gems] = %w(bundler rake pry)
default[:rvm_packages]    = case platform
  when "debian","ubuntu"
    [
      "bison",
      "curl",
      "libcurl3",
      "libcurl3-gnutls",
      "libcurl4-openssl-dev",
      "libreadline5",
      "libreadline5-dev",
      "libssl-dev",
      "libsqlite3-0",
      "libsqlite3-dev",
      "libxml2",
      "libxml2-dev",
      "libxslt1-dev",
      "libyaml-dev",
      "openssl",
      "sqlite3",
      "zlib1g",
      "zlib1g-dev"
    ]
  when "centos", "redhat", "fedora", "suse"
    [
      "curl",
      "patch",
      "readline",
      "readline-devel",
      "zlib",
      "zlib-devel",
      "libyaml-devel",
      "libffi-devel",
      "iconv-devel"
    ]
  end
