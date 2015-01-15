#!/usr/bin/env ruby

require 'rubygems'
require 'sinatra'

set :port, 4567
set :logging, true
set :environment, :production

get '/' do
  "Welcome to the Kohl's ruby user group\n"
end

get '/kohls/unix' do
   "Welcome to the Kohl's unix group page\n"
end

post '/kohls/:store' do |store|
   "Welcome to kohls store #{store}\n"
end

post '/kohls/:store/:department' do |store, department|
   "Welcome to kohls store #{store} and department #{department}\n"
end

get '/settings' do
   "Sinatra running on port: <b>#{settings.port}</b><br>
    Sinatra logging enabled?: <b>#{settings.logging}</b><br>
    Sinatra environment: <b>#{settings.environment}</b>"
end

get %r{/kohls/([np][al][gm]\d{5})} do |capture|
   "Server name : #{capture} was called "
end
