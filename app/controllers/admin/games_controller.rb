module Admin
  class GamesController < ApplicationController
    before_filter :authorize_admin!

    def edit
      @game = Game.find(params[:id])
    end

    def update
      @game = Game.find(params[:id])
      if @game.update(game_params)
        flash[:success] = "You successfully edited the game!"
        redirect_to game_path(@game)
      else
        flash[:success] = @game.errors.full_messages.join(".  ")
        render :edit
      end
    end

    protected

    def game_params
      params.require(:game).permit(:title, :price)
    end
  end
end
