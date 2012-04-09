require 'bundler/setup'
Bundler.require(:default)

require File.dirname(__FILE__) + "/lib/app.rb"
require File.dirname(__FILE__) + "/lib/app2.rb"

#Default route (if no others match)
map "/" do
	run ModularSinatraApps2::App
end

map "/app1" do
	run ModularSinatraApps::App
end
