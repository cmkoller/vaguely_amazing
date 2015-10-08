class HomesController < ApplicationController
  def index
  end

  def toss
    @feedback = Feedback.new
  end
end
