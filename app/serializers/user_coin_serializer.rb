class UserCoinSerializer < ActiveModel::Serializer
  attributes :id, :user_id, :coin_id, :quantity

  belongs_to :user
  belongs_to :coin
end
