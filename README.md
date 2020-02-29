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

done on 20th
1. rails g resource exchange currency rate
2. rails g resource portfolio local_amt home_amt exchange:references
3. rails g resource transaction sell_amt buy_amt effectivefx portfolio:references
4. establish associations: belngs_to/has_many
5. rails db:migrate
6. create seed data!S

added on 21st
<<<<<<< HEAD
7. rails g resource fxhistory currency rate portfolio:references
8. establish association: portfolio has_many :fxhistory
=======
7. rails g resource fxhistory currency rate
8. establish association: portfolio has_many :fxhistory


To POST new Account
Started GET "/exchanges" for ::1 at 2019-10-22 17:41:03 +0100
Processing by ExchangesController#index as */*
  Exchange Load (0.2ms)  SELECT "exchanges".* FROM "exchanges"
  ↳ app/controllers/exchanges_controller.rb:6:in `index'
No serializer found for resource: #<Exchange id: 5, currency: "GBPUSD", rate: 1.2985, created_at: "2019-10-21 13:59:09", updated_at: "2019-10-21 13:59:09">
[active_model_serializers] Rendered ActiveModel::Serializer::CollectionSerializer with Exchange::ActiveRecord_Relation (0.77ms)
Completed 200 OK in 4ms (Views: 3.6ms | ActiveRecord: 0.2ms | Allocations: 2360)


以下はdeleteno時。シリアライザーをコメントアウトしていた場合に怒った
Started GET "/exchanges" for ::1 at 2019-10-22 22:31:43 +0100
   (0.2ms)  SELECT sqlite_version(*)
Processing by ExchangesController#index as */*
  Exchange Load (0.2ms)  SELECT "exchanges".* FROM "exchanges"
  ↳ app/controllers/exchanges_controller.rb:6:in `index'
No serializer found for resource: #<Exchange id: 5, currency: "GBPUSD", rate: 1.2985, created_at: "2019-10-21 13:59:09", updated_at: "2019-10-21 13:59:09">
[active_model_serializers] Rendered ActiveModel::Serializer::CollectionSerializer with Exchange::ActiveRecord_Relation (0.76ms)
Completed 200 OK in 7ms (Views: 6.5ms | ActiveRecord: 0.2ms | Allocations: 2379)
>>>>>>> Takeshi
