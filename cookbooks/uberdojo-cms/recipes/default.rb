#
# Cookbook Name:: uberdojo-cms
# Recipe:: default
#
# Copyright 2012, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

include_recipe "yum::epel"

package 'nginx'

service 'iptables' do
  supports :status => true, :restart => true, :reload => true
  action [ :disable, :stop ]
end

service 'nginx' do
  supports :status => true, :restart => true, :reload => true
  action [ :enable, :start ]
end

template "/etc/nginx/conf.d/default.conf" do
  mode "0644"
  source "nginx_conf.erb"
  notifies :restart, "service[nginx]"
end


