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

- In Ruby the return value of the last line of a function 
will be the return value of the entire function

```ruby
   .
   .

get '/' do
   "Welcome to the Kohl's ruby user group\n"
end

get '/kohls/unix' do
   "Welcome to the Kohl's unix group page\n"
end
```

Testing...

```shell
curl -X GET localhost:4567
curl -X GET localhost:4567/kohls/unix
```

```shell
curl -X GET localhost:4567
curl -X GET localhost:4567/kohls/unix
```


