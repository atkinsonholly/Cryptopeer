class CreateTransactions < ActiveRecord::Migration[5.2]
  def change
    create_table :transactions do |t|
      t.integer :user_one_id
      t.integer :user_two_id
      t.float :user_one_amount
      t.float :user_two_amount
      t.string :user_one_currency_symbol
      t.string :user_two_currency_symbol

      t.timestamps
    end
  end
end
