class AddSellingToUserCoins < ActiveRecord::Migration[5.2]
  def change
    add_column :user_coins, :selling, :boolean
  end
end
