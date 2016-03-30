#
# Cookbook Name:: cygwin-configuration
# Recipe:: default
#
# Copyright 2016, Michael Vershinin
#
# All rights reserved - Do Not Redistribute
#

src = "http://my_ftp/DevTools/Cygwin/x86/cygwin_patch_1.7.6.zip"
dir_path = "#{node['cygwin']['install_dir']}\\bin" 
install = false

ruby_block "Check Cygwin install_dir" do # check install_dir in run time, need for running cygwin and cygwin-configuration in runlist
	block do
		if ((::File.exists?("#{dir_path}")) && !node['cygwin']['install_dir'].nil?)
			install = true
		else
			Chef::Log.info("### You must install cygwin before you're run this recipe ###")
		end
	end
end

# Rename files
ruby_block "Rename file" do
	block do 
		for file_name in node['cygwin-configuration']['file_list']
			new_name = file_name.split(".")[0] + node['cygwin-configuration']['new_extention']
			if ::File.exist?("#{dir_path}\\#{new_name}")
				Chef::Log.info("### Your file: '#{new_name}' already renemed ###")
			else
				if ::File.exist?("#{dir_path}\\#{file_name}")
					::File.rename("#{dir_path}\\#{file_name}", "#{dir_path}\\#{new_name}")
				else 
					Chef::Log.info("### Your file: '#{file_name}' doesn't exist ###")
				end
			end
		end
	end	
only_if {install}	
end 

# Unzip and patch files
windows_zipfile "#{dir_path}" do
	source "#{src}"
	action :unzip
	overwrite true
	only_if {install}
end

# Delete zip
file "#{Chef::Config['file_cache_path']}\\#{File.basename(src)}" do
	action :delete
end
