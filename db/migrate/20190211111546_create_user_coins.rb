class CreateUserCoins < ActiveRecord::Migration[5.2]
  def change
    create_table :user_coins do |t|
      t.integer :user_id
      t.integer :coin_id
      t.float :quantity

      t.timestamps
    end
  end
end
