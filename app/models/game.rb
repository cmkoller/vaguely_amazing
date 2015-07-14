class Game < ActiveRecord::Base
  has_many :purchases
  has_many :buyers, through: :purchases

  def cart_action(current_cart_id)
    if $redis.sismember "cart#{current_cart_id}", id
      "Remove from"
    else
      "Add to"
    end
  end
end
