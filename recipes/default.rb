#
# Cookbook Name:: rvm
# Recipe:: default
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

include_recipe "git"

package "curl"

# Ensure packages required by MRI are installed
if platform?("debian", "ubuntu")
  package "bison"
  package "libcurl3"
  package "libcurl3-gnutls"
  package "libcurl4-openssl-dev"
  package "libreadline5"
  package "libreadline5-dev"
  package "libssl-dev"
  package "libsqlite3-0"
  package "libsqlite3-dev"
  package "libxml2"
  package "libxml2-dev"
  package "libxslt1-dev"
  package "openssl"
  package "sqlite3"
  package "zlib1g"
  package "zlib1g-dev"
elsif platform?("centos", "redhat", "fedora", "suse")
  package "patch"
  package "readline"
  package "readline-devel"
  package "zlib"
  package "zlib-devel"
  package "libyaml-devel"
  package "libffi-devel"
  package "iconv-devel"
end

install_rvm

node["rvm"]["rubies"].each { |ruby| install_ruby ruby }
