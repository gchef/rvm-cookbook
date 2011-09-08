#
# Cookbook Name:: rvm
# Attribute File:: default
#
# Author:: Gerhard Lazu (<gerhard@lazu.co.uk>)
#
# Copyright 2011, Gerhard Lazu
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

default[:rvm_source] = "https://rvm.beginrescueend.com/install/rvm"
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
