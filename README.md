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

1. rails g resource exchange currency rate
2. rails g resource portfolio local_amt home_amt exchange:references
3. rails g resource transaction sell_amt buy_amt effectivefx portfolio:references
4. establish associations: belngs_to/has_many