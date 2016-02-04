Follow along as we create the application

## General resources
### Rails commands
README.md holds instructions on bulding the application, but you should also find the following useful:
http://guides.rubyonrails.org/command_line.html
* `rails s` runs the application locally
* `rails s --binding=0.0.0.0` runs the locally and lets other users on the network connect to it
* `rails c` starts the interactive console

### Debugging
We're using [byebug](https://github.com/deivid-rodriguez/byebug/blob/master/GUIDE.md) 
(See also http://edgeguides.rubyonrails.org/debugging_rails_applications.html#debugging-with-the-byebug-gem).
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
* `rake test`

## Modify the controller
### Strong parameters
http://guides.rubyonrails.org/action_controller_overview.html#strong-parameters

## Run tests
<<<<<<< HEAD
* ` rake test`
=======
* `rake test`

# Active Admin
The Active Admin gem provides authorization and authentication of users and administrators.  It uses Devise under the hood to administer users and even provides a UI component for user administration.

We want to allow folks who are not registered to report offenses, but not to view, change or delete them. Nor do we want anyone to manually create an offense -- only if someone leaves their computer unsecured should an offense be created.

## Add Active Admin to the project
* add the Active Admin and Devise gems to the Gemfile
```
gem 'activeadmin', github: 'activeadmin'
gem 'devise'
```
* run `bundle install`

Often we do _not_ have to tell Bundler to get the gem from a GitHub repository, but we do here because we'reusing Rails 4 and there are dependency issues (explained on [the Active Admin README](https://github.com/activeadmin/activeadmin).

## Install Active Admin
Let's follow the rest of the instructions on [the Acive Acmin installation page](https://github.com/activeadmin/activeadmin/blob/master/docs/0-installation.md).  We've added the gem, but we now want to generate the rest of the code that we need to use it (also not something we do for most gems we use) and create database objects and data.

### Install administrator components
Our application will only have adminstrators who can view data and anonymous reporters who will log offenses, so we don't need to create a User model, just one for Administrators.
* `rails g active_admin:install` will generate files for Administrators, including a migration to create the table

### Add the Administrators table
* `rake db:migrate`

### Create a default administrator
We'll only use this record for our development environment because the credentials are common knowledge.
* `rake db:seed`
admin@example.com/password

## Integrate Active Admin with our application
We want anybody to be able to create an offense, but we only want certain folks to be able to see and/or change offenses so we want to make sure that our create or report action doesn't require credentials, but everywhere else does.
>>>>>>> Savepoint for documentation

