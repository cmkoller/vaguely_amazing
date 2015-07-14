class CartsController < ApplicationController

  def show
    cart_ids = $redis.smembers current_cart
    @cart_games = Game.find(cart_ids)
  end

  def add
    $redis.sadd current_cart, params[:movie_id]
    render json: CartManager.new(session[:cart_id]).cart_count, status: 200
  end

  def remove
    $redis.srem current_cart, params[:movie_id]
    render json: CartManager.new(session[:cart_id]).cart_count, status: 200
  end

  private

  def current_cart
    session[:cart_id] ||= "#{Time.now.to_i}#{rand(100)}"
    "cart#{session[:cart_id]}"
  end
 end
