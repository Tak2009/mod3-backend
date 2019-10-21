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

done on 19th
1. rails g resource exchange currency rate
2. rails g resource portfolio local_amt home_amt exchange:references
3. rails g resource transaction sell_amt buy_amt effectivefx portfolio:references
4. establish associations: belngs_to/has_many
5. rails db:migrate
6. create seed data!S

added on 21st
7. rails g resource fxhistory currency rate portfolio:references
8. establish association: portfolio has_many :fxhistory