class Admin::DashboardsController < ApplicationController
  def index
    if !current_user.present?
      redirect_to new_user_session_path
    end
  end
end
