class Portfolio < ApplicationRecord
  belongs_to :exchange
  has_many :transactions
  has_many :fxhistories
end
