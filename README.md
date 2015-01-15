# Sinatra 

## What is Sinatra and what does it provide?

## Installing sinatra
```shell
   # yum install rubygems
   # gem install sinatra
```

## Getting Started

```ruby
#!/usr/bin/env ruby

require 'rubygems'  # Needed for ruby 1.8.7 and below
require 'sinatra'  
```

## Sintra URL routing

Pairing of a HTTP method (GET POST PUT DELETE PATCH)
with a url matching pattern

* Sinatra defines a keyword corresponding to each HTTP method
* Ruby convention :: last line is return value

```ruby
get '/' do
   "Welcome to the Kohl's ruby user group\n"
end

get '/kohls/unix' do
   "Welcome to the Kohl's unix group page\n"
end
```

Testing... via the web browser or cURL

```shell
curl -X GET localhost:4567
curl -X GET localhost:4567/kohls/unix
```

Listening for POST requests

```ruby
post '/kohls/:store' do |store|
   "Welcome to kohls store #{store}"
end
```

Making a POST request

```shell
curl -X POST -d "" localhost:4567/kohls/store1500
```

