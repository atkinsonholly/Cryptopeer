class User < ApplicationRecord
  has_many :user_coins
  has_many :coins, through: :user_coins

  def transactions
    Transaction.where("user_one_id = ? OR user_two_id = ?", self.id, self.id)
  end

  has_secure_password

  validates :username, presence: true, uniqueness: true
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true, uniqueness: true
  validates :password, presence: true

  def full_name
    "#{self.first_name.capitalize} #{self.last_name.capitalize}"
  end

end
