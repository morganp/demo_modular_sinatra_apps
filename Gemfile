
source :rubygems
#If this is a gem 
#Normal gems go in modular_sinatra_apps.gemspec
#gemspec
#gem "heroku", "~>2"
gem "sinatra",        "~>1", :require => 'sinatra/base' 
#gem "activerecord", "~>3" , :require => 'active_record'
#gem "sinatra-session", "~>1"
#gem "sinatra-flash", "~> 0.3"

#development and test not install on heroku deployment
group :development do
#  gem "sinatra-reloader", "~>0"
#  gem "sqlite3-ruby", "~>1"
  gem "thin", "~>1"
end

group :test do
  gem "rspec", :require => "spec"
end
