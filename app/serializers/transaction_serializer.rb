class TransactionSerializer < ActiveModel::Serializer
  attributes :id, :user_one_id, :user_two_id, :user_one_amount, :user_two_amount, :user_one_currency_symbol, :user_two_currency_symbol

  belongs_to :user_one
  belongs_to :user_two
end
