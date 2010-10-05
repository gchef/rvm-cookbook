#
# Cookbook Name:: rvm
# Recipe:: default
#
# Copyright 2010, Papercavalier
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
include_recipe "helper"

class Chef::Resource
  include FileHelpers
end

bash "Install RVM system-wide" do
  code "bash < <( curl -L http://bit.ly/rvm-install-system-wide )"
  not_if { File.exists? "/usr/local/rvm" }
end

bash "Add RVM to the global profile" do
  file_append("/etc/profile", "[[ -s '/usr/local/lib/rvm' ]] && source '/usr/local/lib/rvm'")
end

add_rvmrc "root"
