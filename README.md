# README

# Setup the application
  * Clone this repo
  * Go to root directory for the application
  * Run the `bundle install`
  * Run the `rake db:create rake db:migrate`
  * Start the sidekiq `bundle exec sidekiq`
  * Load sample data run the `rake db:seed`
  * Start the server `rails s`