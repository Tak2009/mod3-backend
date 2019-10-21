class Portfolio < ApplicationRecord
  belongs_to :exchange
  belongs_to :fxhistory
  has_many :transactions
end
