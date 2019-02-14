class UserCoinSerializer < ActiveModel::Serializer
  attributes :id, :user_id, :coin_id, :quantity, :selling

  belongs_to :user
  belongs_to :coin
    
end
