# Sinatra 

## What is Sinatra and what does it provide?
* Minimalistic web development framework
* Extremely easy to set up and run
* Bundles the WEBrick web server
* Geared for simple API development

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

At this point, run the script and 
try navigating to http://localhost:4567

# Configuring Sinatra
No real configuration needed- very usable out of box
Some simple configuration options

**Ruby Protip :: labels begin with a colon and are translated to numbers to improve performance**

General syntax
set :label, value

Settings are globally available in the settings variable

```ruby
set :port, 4567
set :logging, true
set :environment, :production

# access these values later
settings.port      # => evalutes to 4567
settings.logging   # => evalutes to true
```

## Serving static files
By default all files in the public directory are served statically
No code / config required outside of the require


## Sintra URL routing

Pairing of a HTTP method (GET POST PUT DELETE PATCH)
with a url matching pattern

* Sinatra defines a keyword corresponding to each HTTP method

**Ruby Protip :: the return value of the last line of a function is return value of the function**

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
Post variables can be passed in as block variables 
```ruby
post '/kohls/:store' do |store|
   "Welcome to kohls store #{store}"
end

# Using more than one parameter
post '/kohls/:store/:department' do |store, department|
   "Welcome to kohls store #{store} and department #{department}\n"
end

```

Making a POST request
(need to set "Content-Length" header to 0 with -d "")
```shell
curl -X POST -d "" localhost:4567/kohls/store1500

curl -X POST -d "" localhost:4567/kohls/store1500
```

Wildcards and regular expressions


