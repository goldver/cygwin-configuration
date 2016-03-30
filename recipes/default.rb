#
# Cookbook Name:: cygwin-configuration
# Recipe:: default
#
# Copyright 2016, Michael Vershinin
#
# All rights reserved - Do Not Redistribute
#

include_recipe "#{cookbook_name}::clear_temp_folder"
include_recipe "#{cookbook_name}::cygwin_configuration"
