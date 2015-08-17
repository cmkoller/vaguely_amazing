module Admin
  class GamesController < ApplicationController
    before_filter :authorize_admin!

    def index
      @games = Game.all
    end

    def new
      @game = Game.new
    end

    def create
      @game = Game.new(game_params)
      if @game.save
        flash[:success] = "You successfully created a game!"
        redirect_to game_path(@game)
      else
        flash[:success] = @game.errors.full_messages.join(".  ")
        render :new
      end
    end

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
      params.require(:game).permit(:title, :price, :file, :featured_image)
    end
  end
end
