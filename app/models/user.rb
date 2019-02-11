class User < ApplicationRecord
  has_many :user_coins
  has_many :coins, through: :user_coins

  def transactions
    Transaction.where("user_one_id = ? OR user_two_id = ?", self.id, self.id)
  end
end
