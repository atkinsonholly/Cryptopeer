class UserSerializer < ActiveModel::Serializer
  attributes :id, :username, :first_name, :last_name, :profile_pic_url, :transactions, :user_coins

  # has_many :user_coins
  # has_many :coins, through: :user_coins

  def user_coins
    UserCoin.where(user_id: self.object.id).map{ |usercoin| {coin_id: usercoin.coin_id, id: usercoin.id, quantity: usercoin.quantity, selling: usercoin.selling, user_id: usercoin.user_id, symbol: usercoin.coin.symbol, name: usercoin.coin.name, price: usercoin.coin.price}}
  end

  def transactions
    Transaction.where("user_one_id = ? OR user_two_id = ?", self.object, self.object)
  end
end
