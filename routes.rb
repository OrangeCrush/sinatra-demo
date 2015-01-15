#!/usr/bin/env ruby

require 'rubygems'
require 'sinatra'

get '/' do
  "Welcome to the Kohl's ruby user group\n"
end

get '/kohls/unix' do
   "Welcome to the Kohl's unix group page\n"
end

post '/kohls/:store' do |store|
   "Welcome to kohls store #{store}"
end
