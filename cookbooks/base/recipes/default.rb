#
# Cookbook Name:: base
# Recipe:: default
#
# Copyright 2014, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

# iptables stop
service 'iptables' do
	action [:stop, :disable]
end

# add repository
%w{epel remi}.each do |name|
	yum_repository name do
		description node['repo'][name]['description']
		mirrorlist node['repo'][name]['mirrorlist']
		gpgkey node['repo'][name]['gpgkey']
		action :create
	end
end

# install php
%w{php php-common php-mbstring php-xml php-devel php-process php-cli php-mysql}.each do |p|
	package p do
		action :install
	end
end

# install apache
package 'httpd' do
	action :install
end

# install mysql-server
package 'mysql-server' do
	action :install
end

# service httpd
service 'httpd' do
	supports :status => true, :restart => true, :reload => true
	action [:enable, :start]
end

# service mysql-server
service 'mysqld' do
	action [:enable, :start]
end

# add groups
group "apache" do
	action :modify
	members ['vagrant']
	append true
	notifies :restart, "service[httpd]"
end

# setting apache
template "/etc/httpd/conf/httpd.conf" do
	source "httpd.conf.erb"
	mode "0644"
	notifies :restart, "service[httpd]"
end

template "/etc/httpd/conf.d/php.conf" do
	source "php.conf.erb"
	mode "0644"
	notifies :restart, "service[httpd]"
end

# setting php
template "/etc/php.ini" do
	source "php.ini.erb"
	mode "0644"
	notifies :restart, "service[httpd]"
end

# setting mysql-server
template "/etc/my.cnf" do
	source "my.cnf.erb"
	mode "0644"
	notifies :restart, "service[mysqld]"
end
