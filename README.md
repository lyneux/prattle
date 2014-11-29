# Prattle

Prattle is a Rails engine providing forum functionality. It provides basic forum, topic and post functionality to the parent application.

Prattle focuses on sensible functionality ahead of Ruby-on-Rails cleverness to deliver a forum that works rationally and looks great.

# Installation

Installing prattle is simple:

## Specify Gem dependencies

```ruby
gem 'prattle', :github => "lyneux/prattle"
```

## Add an initialiser to the parent app:
Create a prattle.rb file in config/initalizers

```ruby
Prattle.user_class  = "Your user class"
Prattle::ApplicationController.layout "Your layout"
```
## Add a prattle_user helper method to your Application Controller
This allows prattle to link posts to the user who is currently logged into your application

```ruby
  def prattle_user
    current_member
  end
  helper_method :prattle_user
```

## Add a prattle_admin? helper method to your session helper
If you have your own authentication scheme, you likely also have your own authorisation scheme. This method should return true if the current user is an administrator

```ruby
  	def prattle_admin?
		#Your code here. Example:
		current_member.member_admin? if !current_member.nil?
	end
```

## Copy over and run the migrations

In your parent app:

```shell
rake prattle:install:migrations
rake db:migrate
```

