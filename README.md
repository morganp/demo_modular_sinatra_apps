
ModularSinatraApps
==================

A basic demonstration of multiple Sinatra applications under different routes. 


EXAMPLES
========

The modular applications would have to be installed via gems or local, it is the config.ru that performs the top level routing before sinatra sees the app.

    require 'bundler/setup'
    Bundler.require(:default)

    require File.dirname(__FILE__) + "/lib/app.rb"

    #Default route (if no others match)
    map "/" do
      run ModularSinatraApps2::App
    end

    map "/app1" do
      run ModularSinatraApps::App
    end


In this sample app Each app has a '/' route and a '/whichapp' route. The follwing routes return:

   /              => 'Application2 Hello'
   /whichapp      => 'Application2 /whichapp'
   /app1          => 'Application1 Hello'
   /app1/whichapp => 'Application1 /whichapp'

Visiting /other/new_url the ModularSinatraApps is accessed via /other and the Sinatra application will act like it recieved the /new_url route. This might be useful with Sinatra modules to be distributed via gems and then can be put under a route.  For example creating a [wiki application][sinatra_wiki] with '/' and '/new_page' routes then adding them to a Rack app and adding the Wiki app under '/wiki' any wiki page accessed the wiki app would respond as if the '/wiki' part was just not there.


[sinatra_wiki]: http://morganp.github.com/sinatra_wiki
