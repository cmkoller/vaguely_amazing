class Admin::FeedbacksController < ApplicationController
  before_filter :authorize_admin!

  def index
    @feedbacks = Feedback.all
  end
end
