class Game < ActiveRecord::Base
  has_many :purchases
  has_many :buyers, through: :purchases

  validates :title, presence: true
  validates :price, presence: true

  mount_uploader :file, GameFileUploader
  mount_uploader :featured_image, GameFeaturedImageUploader

  def cart_action(current_cart_id)
    if $redis.sismember "cart#{current_cart_id}", id
      "Remove from"
    else
      "Add to"
    end
  end
end
