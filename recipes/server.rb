include_recipe 'selenium::default'
include_recipe 'runit'

package 'xvfb'

directory node['selenium']['server']['installpath']

remote_file File.join(node['selenium']['server']['installpath'], 'selenium-server-standalone.jar') do
  source "http://selenium.googlecode.com/files/selenium-server-standalone-#{node['selenium']['server']['version']}.jar"
  action :create_if_missing
  mode 0644
end

template '/usr/local/bin/runxvfb' do
  source 'runxvfb.erb'
  mode 0755
  owner 'root'
  group 'root'
end

user node['selenium']['server']['user']

directory node['selenium']['server']['logpath'] do
  owner node['selenium']['server']['user']
  recursive true
end

runit_service 'selenium' do
  action [ :enable, :start ]
end

runit_service 'xvfb' do
  action [ :enable, :start ]
end