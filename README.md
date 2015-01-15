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

For a simpler install I decided to make this guide with ruby 193
and sinatra 1.4.5
```
$ ruby --version && gem list | grep sinatra
ruby 1.9.3p484 (2013-11-22 revision 43786) [x86_64-linux]
sinatra (1.4.5)

```

## Getting Started

Instead of using irb for this tutorial I will put all my code in
routes.rb

file: routes.rb
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

(i.e.  :bread, or :paper)

General syntax
set :label, value

Settings are globally available in the settings variable

file: routes.rb
```ruby
set :port, 4567
set :logging, true
set :environment, :production

# access these values later as
settings.port      # => evalutes to 4567
settings.logging   # => evalutes to true
```

**Ruby Protip #1 :: labels are string tokens that begin with a colon and are translated to numbers to improve performance**
Labels are not specific to sinatra

## Serving static files
By default all files in the public directory are served statically
No code / config required outside of the require

```shell
[maxwell@Asgard:~/github/sinatra-demo  (master *)  BASH]
$ ls -lR
.:
total 12
drwxrwxr-x 2 maxwell maxwell 4096 Jan 14 21:39 public/
-rw-rw-r-- 1 maxwell maxwell 2229 Jan 14 22:41 README.md
-rwxrwxr-x 1 maxwell maxwell  659 Jan 14 22:28 routes.rb*

./public:
total 4
-rw-rw-r-- 1 maxwell maxwell 129 Jan 14 21:39 index.html
```

index.html can be accessed at localhost:4567/index.html


## Sintra URL routing

Pairing of a HTTP method (GET POST PUT DELETE PATCH)
with a url matching pattern

* Sinatra defines a keyword corresponding to each HTTP method

**Ruby Protip #2 :: the return value of the last line of a function is return value of the function**

file: routes.rb
```ruby
get '/' do
   "Welcome to the Kohl's ruby user group\n"
end

get '/kohls/unix' do
   "Welcome to the Kohl's unix group page\n"
end


# A more Practical example.. Display sinatras settings

get '/settings' do
   "Sinatra running on port: <b>#{settings.port}</b><br>
    Sinatra logging enabled?: <b>#{settings.logging}</b><br>
    Sinatra environment: <b>#{settings.environment}</b>"
end
```

Testing... via the web browser or cURL

```shell
curl -X GET localhost:4567
curl -X GET localhost:4567/kohls/unix
curl -X GET localhost:4567/settings
```

Listening for POST requests
Post variables can be passed in as block variables 

file: routes.rb
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

### Route matching Regular expressions

Can force routes to only be called if the route matches a regex

example regex to match a server hostname at Kohls ([np][al][gm]\d{5})

file: routes.rb
```ruby
get %r{/kohls/([np][al][gm]\d{5})} do |capture|
   "Server name : #{capture} was called "
end
```

**Ruby Protip #3 :: Surrounding a string with %r{} or '/'s turns the string into a regex**

(Much easier to read this regex with the %r{} syntax)

Try it out
```ruby
irb(main):009:0> /[np][al][mg]\d{5}/.match 'nlg00495'
=> #<MatchData "nlg00495">

irb(main):010:0> /[np][al][mg]\d{5}/.match 'xyz12345'
=> nil
```


## ERB templates

Embeded ruby templates are a great way to serve dynamic HTML

Put erb code in views/template_name.erb
use sinatra's erb function to compile and serve the template.

get '/erb' do
   erb :template_name, :locals = {:name => 'Max'}
end


## A Practical example
Write a simple web app that can tell if a server
is being worked on and in maintenance mode

Routes to set up

GET  /app/:servername   -> Check the servers status (is it in maintenance mode? )
POST /app/:servername   -> Check the servers status (is it in maintenance mode? )

Use a Hash to maintain a list of servers

Servers
   nlm00121  => true  ...... (this server is in maintenance mode)
   nlm00124  => false ...... (this server is not in maintenance mode)
