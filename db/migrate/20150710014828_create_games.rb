class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.string :title, null: false
      t.float :price
    end
  end
end
