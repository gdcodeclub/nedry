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

## Create the new Rails application
http://guides.rubyonrails.org/command_line.html#rails-new
`rails new nedry`

## Create the `Offense` model and components
http://guides.rubyonrails.org/command_line.html#rails-generate
`rails generate offense`