#
# Author:: Sachin Sagar Rai <millisami@gmail.com>
# Cookbook Name:: phpbb
# Recipe:: auto_install
#
# Copyright (C) 2013 Millisami
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
# http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

ex = execute "apt update" do
  command "apt-get update"
  action :nothing
end
ex.run_action :run

node.set['build_essential']['compiletime'] = true
include_recipe "build-essential"

p = package "phantomjs" do
  action :nothing
end
p.run_action :install

chef_gem 'capybara'
chef_gem 'poltergeist'
chef_gem 'launchy'
require 'capybara'
require 'capybara/dsl'
require 'capybara/poltergeist'
require 'launchy'

# template "/tmp/phpbb_auto_instaler.rb" do
#   source "auto_installer.erb"
#   owner "root"
#   group "root"
#   mode 00644
#   variables(
#     :domain => node['phpbb']['auto_installer']['domain'],
#     :db_host => node['phpbb']['auto_installer']['db_host'],
#   )
# end
