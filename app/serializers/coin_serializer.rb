class CoinSerializer < ActiveModel::Serializer
  attributes :id, :name, :symbol, :price

  has_many :user_coins
  has_many :users, through: :user_coins
end
