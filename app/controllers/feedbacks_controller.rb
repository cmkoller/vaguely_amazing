class FeedbacksController < ApplicationController
  def create
    @feedback = Feedback.new(feedback_params)
    if @feedback.save
      flash[:success] = "Thanks! Your feedback has been recorded!"
      redirect_to toss_path
    else
      flash[:alert] = @feedback.errors.full_messages.join(". ")
      render :"homes/toss"
    end
  end

  protected

  def feedback_params
    params.require(:feedback).permit(:name, :email, :feedback)
  end
end
