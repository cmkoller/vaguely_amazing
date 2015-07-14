class CartManager
  def initialize(cart_id)
    @cart_id = "cart#{cart_id}"
  end

  def cart_count
    $redis.scard @cart_id
  end

  def cart_total_price
    total_price = 0
    get_cart_games.each { |game| total_price+= game.price }
    total_price
  end

  def get_cart_games
    cart_ids = $redis.smembers @cart_id
    Game.find(cart_ids)
  end

  def purchase_cart_games!
    game_ids = get_cart_games.pluck[:id]
    get_cart_games.each { |game| purchase(game) }
    $redis.del @cart_id
    game_ids
  end

  def purchase(game)
    # session[:games] ||= []
    # session[:games] << game unless purchase?(game)
  end

  def purchase?(game)
    # session[:games].include?(game)
  end
end
