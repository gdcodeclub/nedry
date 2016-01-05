Follow along as we create the application

## General resources
### Rails commands
README.md holds instructions on bulding the application, but you should also find the following useful:
http://guides.rubyonrails.org/command_line.html
* `rails s` runs the application locally
* `rails s --binding=0.0.0.0` runs the locally and lets other users on the network connect to it
* `rails c` starts the interactive console

### Debugging
We're using [byebug](https://github.com/deivid-rodriguez/byebug/blob/master/GUIDE.md) (see also
http://edgeguides.rubyonrails.org/debugging_rails_applications.html#debugging-with-the-byebug-gem).
* place `byebug` anywhere in the code that you want to suspend execution

### Testing
http://edgeguides.rubyonrails.org/testing.html
* `rake db:test:prepare` to make sure your test database is up to date
* `rake test` to run all tests

### Preparing your local environments
If you already have checked out the shared repository, you'll want to do most of the following each time you start
* Get the latest code from the shared repository
* `bundle install` to update/install per Gem changes
* `rake db:migrate` to make sure your development database is up to date
* `rake db:test:prepare` to make sure your test database is up to date

#### Getting the latest code from the shared repository
* Make sure to commit your local changes first (probably in a non-master branch)
* `git checkout master` to get back to your local master
* `git fetch -va origin master` to become aware of new branches (only if you want to work on non-master branches in the shared repository)
* `git checkout --rebase origin master` to update with the latest code in the master branch of the shared repository


# Developing
* Create the application
* Create the model
* Run migrations
* Run tests
* Modify the controller
* Run tests

## Create the new Rails application
http://guides.rubyonrails.org/command_line.html#rails-new
* `rails new nedry` creates the project

## Create the `offense` model and components
http://guides.rubyonrails.org/command_line.html#rails-generate
* `rails generate offense` creates the model and components

### Understand the controller
http://edgeguides.rubyonrails.org/action_controller_overview.html

## Add `ip_address` to the `offense` model
http://edgeguides.rubyonrails.org/active_record_migrations.html

## Run migrations
* `rake db:migrate` runs against the development database
* `rake db:test:prepare` runs against the test database

## Run tests
* ` rake test`

## Modify the controller
### Strong parameters
http://guides.rubyonrails.org/action_controller_overview.html#strong-parameters

## Run tests
* ` rake test`

