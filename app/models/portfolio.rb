class Portfolio < ApplicationRecord
  belongs_to :exchange
  has_many :transactions
end
