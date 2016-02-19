class FeedbacksController < ApplicationController
  def new
    @feedback = Feedback.new
  end

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
    params.require(:feedback).permit(
      :name, :email, :other_feedback,

      :encounters_frustrating,
      :encounters_fun,
      :encounters_simple,
      :encounters_complex,
      :encounters_logical,
      :encounters_appealing,
      :encounters_unappealing,

      :items_frustrating,
      :items_fun,
      :items_simple,
      :items_complex,
      :items_logical,
      :items_appealing,
      :items_unappealing,

      :classes_frustrating,
      :classes_fun,
      :classes_simple,
      :classes_complex,
      :classes_logical,
      :classes_appealing,
      :classes_unappealing,

      :cooperative_frustrating,
      :cooperative_fun,
      :cooperative_simple,
      :cooperative_complex,
      :cooperative_logical,
      :cooperative_appealing,
      :cooperative_unappealing
    )
  end
end
