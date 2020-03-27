class FxHistorySerializer < ActiveModel::Serializer
  attributes :id, :currency, :rate
end
