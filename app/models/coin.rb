class Coin < ApplicationRecord
  has_many :user_coins
  has_many :users, through: :user_coins
end
