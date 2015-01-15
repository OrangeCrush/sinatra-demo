#!/usr/bin/env ruby

require 'rubygems'
require 'sinatra'

set :port, 80
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

get %r{^/kohls/([np][al][gm]\d{5})$} do |capture|
   "Server name : #{capture} was called "
end

get %r{^/kohls/([np][al][gm]\d{5})$} do |capture|
   "Server name : #{capture} was called "
end

servers = {}

get %r{^/app/([np][al][gm]\d{5})$} do |server|
   if servers[server].nil?
      "Server not in maintenance mode"
   else
      "Server is in maintenance mode"
   end
end

get '/app/servers' do 
   servers.to_s
end

post %r{^/app/([np][al][gm]\d{5})$} do |server|
   if servers[server].nil?
      servers[server] = true
      "Server successfully put in maintenance mode"
   else
      "Server is already in maintenance mode, check back later"
   end
end
