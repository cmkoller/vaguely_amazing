class HomesController < ApplicationController
  def index
  end

  def toss
    @feedback = Feedback.new
  end

  def about_us
  end

  def press_kit
  end
end
