class TransactionsController < ApplicationController
  before_action :check_cart!

  def new
    gon.client_token = generate_client_token
  end

  def create
    @email = params[:email]
    @result = Braintree::Transaction.sale(
              amount: CartManager.new(session[:cart_id]).cart_total_price,
              payment_method_nonce: params[:payment_method_nonce])
    if @result.success?
      session[:game_ids] ||= []
      session[:game_ids] += CartManager.new(session[:cart_id]).purchase_cart_games!
      redirect_to root_url, notice: "Congraulations! Your transaction has been successfully!"
    else
      flash[:alert] = "Something went wrong while processing your transaction. Please try again!"
      gon.client_token = generate_client_token
      render :new
    end
  end

  private

  def check_cart!
    if CartManager.new(session[:cart_id]).get_cart_games.blank?
      redirect_to root_url, alert: "Please add some items to your cart before processing your transaction!"
    end
  end

  def generate_client_token
    Braintree::ClientToken.generate
  end

end
