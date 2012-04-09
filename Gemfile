
source :rubygems
#If this is a gem 
#Normal gems go in modular_sinatra_apps.gemspec
#gemspec
#gem "heroku", "~>2"
gem "sinatra",        "~>1", :require => 'sinatra/base' 

#development and test not install on heroku deployment
group :development do
  gem "thin", "~>1"
end

group :test do
  gem "rspec", :require => "spec"
end
