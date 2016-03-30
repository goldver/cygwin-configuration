#
# Cookbook Name:: cygwin-configuration
# Recipe:: clear_temp_folder
#
# Copyright 2016, Michael Vershinin
#
# All rights reserved - Do Not Redistribute
#
tempfolder = "C:\\Windows\\Temp"

powershell_script 'Delete folders content' do
	code <<-EOF
		Get-ChildItem "#{tempfolder}" | ForEach-Object {
			try
			{
				Remove-Item "#{tempfolder}\\$_" -Confirm:$false -Force -Recurse -ErrorAction Stop
			}
			catch
			{
				if (!(Test-Path "#{Chef::Config[:file_cache_path]}\\DeleteTempErrors.log"))
				{
					New-Item DeleteTempErrors.log -ItemType file
				}

				Add-Content "#{Chef::Config[:file_cache_path]}\\DeleteTempErrors.log" "$_.Exception.Message `n" -Force
			}
		 }
	EOF
end