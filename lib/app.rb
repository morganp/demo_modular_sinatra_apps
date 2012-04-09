
require 'bundler/setup'
Bundler.require(:default)

Dir[File.dirname(__FILE__) + '/lib/models/*.rb'].each {|file| require file }

require_relative 'hello_app'

module ModularSinatraApps
  VERSION = '0.0.1'
  
  class App < Sinatra::Base
    use Rack::MethodOverride
    set :public_folder, "public"
    
    #Configure Modules ran when starting/restarting Server
    configure :development do
      puts "Development"
      set :analytics_ena, false

      #ActiveRecord::Base.establish_connection(
      #  :adapter   => 'sqlite3',
      #  :database  => './db/devel.db'
      #)
    end

    configure :test do
      puts "Test"
    end

    configure :production do
      set :analytics_ena, true

      db = ENV["DATABASE_URL"]
      db ||= '' # Making it safe for non heroku deployment
      if db.match(/postgres:\/\/(.*):(.*)@(.*)\/(.*)/) 
        username = $1
        password = $2
        hostname = $3
        database = $4

        #ActiveRecord::Base.establish_connection(
        #  :adapter  => 'postgresql',
        #  :host     => hostname,
        #  :username => username,
        #  :password => password,
        #  :database => database
        #)
      end
    end


    #Ran on Server Error
    error do
      e = request.env['sinatra.error']
      puts e.to_s
      puts e.backtrace.join("\n")
      "Application error"
    end

    get '/' do
      'Application1 Hello'
    end
    
    get '/whichapp' do
      'Application1 /whichapp'
    end

    ## start the server if ruby file executed directly
    run! if app_file == $0
  end
end

