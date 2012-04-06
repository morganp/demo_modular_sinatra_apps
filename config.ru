
#require 'rubygems'
#require './lib/app'
#run ModularSinatraApps::App

require 'bundler/setup'
Bundler.require(:default)

require File.dirname(__FILE__) + "/lib/app.rb"

map "/other" do
	run ModularSinatraApps::App
end

