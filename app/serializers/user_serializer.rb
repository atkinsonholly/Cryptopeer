class UserSerializer < ActiveModel::Serializer
  attributes :id, :username, :first_name, :last_name, :profile_pic_url, :transactions

  has_many :user_coins
  has_many :coins, through: :user_coins

  def transactions
    Transaction.where("user_one_id = ? OR user_two_id = ?", self.object, self.object)
  end
end
