#
# Cookbook Name:: base
# Recipe:: default
#
# Copyright 2014, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

service 'iptables' do
	action [:stop, :disable]
end

%w{epel remi}.each do |name|
	yum_repository name do
		description node['repo'][name]['description']
		mirrorlist node['repo'][name]['mirrorlist']
		gpgcheck node['repo'][name]['gpgcheck']
		action :create
	end
end
