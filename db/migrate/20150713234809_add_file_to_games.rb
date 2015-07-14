class AddFileToGames < ActiveRecord::Migration
  def change
    add_column :games, :file, :string
  end
end
