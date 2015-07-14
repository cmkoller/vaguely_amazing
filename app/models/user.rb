class User < ActiveRecord::Base
  has_many :purchases, foreign_key: :buyer_id
  has_many :games, through: :purchases

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  def cart_count
    $redis.scard "cart#{id}"
  end

  def cart_total_price
    total_price = 0
    get_cart_games.each { |game| total_price+= game.price }
    total_price
  end

  def get_cart_games
    cart_ids = $redis.smembers "cart#{id}"
    Game.find(cart_ids)
  end

  def purchase_cart_games!
    get_cart_games.each { |game| purchase(game) }
    $redis.del "cart#{id}"
  end

  def purchase(game)
    games << game unless purchase?(game)
  end

  def purchase?(game)
    games.include?(game)
  end
end
