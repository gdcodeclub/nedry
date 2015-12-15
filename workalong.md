Follow along as we create the application

## General resources
### Rails commands
README.md holds instructions on bulding the application, but you should also find the following useful:
http://guides.rubyonrails.org/command_line.html
* `rails s` runs the server
* `rails c` starts the interactive console

### Debugging
We're using [byebug](https://github.com/deivid-rodriguez/byebug/blob/master/GUIDE.md) (see also
http://edgeguides.rubyonrails.org/debugging_rails_applications.html#debugging-with-the-byebug-gem).
* place `byebug` anywhere in the code that you want to suspend execution

### Testing
http://edgeguides.rubyonrails.org/testing.html
* `rake test` runs all tests


# Up and running
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
