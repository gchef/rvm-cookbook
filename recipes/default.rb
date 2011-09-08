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

# Ensure most common packages required by Ruby apps are installed
#
node[:rvm_packages].each do |package_name|
  package package_name
end

bash "Installing rvm" do
  code "bash < <(curl -s #{node[:rvm_source]})"
  not_if "[ -d #{node[:rvm_path]} ]"
end

node[:rvm_rubies].each do |ruby|
  bash "RVM installing Ruby #{ruby}" do
    code %{
      #{node[:rvm_script]} install #{ruby}
      #{node[:rvm_script]} --create #{ruby}@global gem install #{node[:rvm_global_gems].join(' ')}
    }
    only_if "[ $(#{node[:rvm_bin]} list | grep -c #{ruby}) -eq 0 ]"
  end
end
