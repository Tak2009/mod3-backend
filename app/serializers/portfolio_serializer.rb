class PortfolioSerializer < ActiveModel::Serializer
  attributes :id, :local_amt, :home_amt, :exchange_id, :created_at, :updated_at
end
