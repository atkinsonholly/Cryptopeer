class AddDetailsToTransactions < ActiveRecord::Migration[5.2]
  def change
    add_column :transactions, :user_one_price, :float
    add_column :transactions, :user_two_price, :float
  end
end
