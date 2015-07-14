class CreatePurchases < ActiveRecord::Migration
  def change
    create_table :purchases do |t|
      t.integer :game_id, null: false
      t.integer :buyer_id, null: false
      t.timestamps
    end

    add_index :purchases, [:game_id, :buyer_id], unique: true
  end
end
