class AddFeaturedImageToGames < ActiveRecord::Migration
  def change
    add_column :games, :featured_image, :string
  end
end
