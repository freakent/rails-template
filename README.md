# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

## Rails Templates
Original templates are here:
Scaffold : https://github.com/rails/rails/tree/8015c2c2cf5c8718449677570f372ceb01318a32/railties/lib/rails/generators/erb/scaffold/templates

## Testing Email settings
In the rails console:
irb(main) > UserMailer.test_email(User.first).deliver_now
From email (set the application mailer needs to be a valid email address of the username/password used to authenticate)