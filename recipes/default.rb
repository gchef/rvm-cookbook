#
# Cookbook Name:: rvm
# Recipe:: default
#
# Copyright 2011, Papercavalier
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
  %w{bison openssl libreadline5 libreadline5-dev zlib1g zlib1g-dev libssl-dev libsqlite3-0 libsqlite3-dev sqlite3 libxml2-dev}
elsif platform?("centos", "redhat", "fedora", "suse")
  %w{patch readline readline-devel zlib zlib-devel libyaml-devel libffi-devel iconv-devel}
else
  []
end.each { |name| package name }

install_rvm do
  rubies node["rvm"]["rubies"]
end
