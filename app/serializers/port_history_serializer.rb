class PortHistorySerializer < ActiveModel::Serializer
  attributes :id, :local_amt, :home_amt
end
