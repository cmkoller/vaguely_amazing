class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def authorize_admin!
    if current_user.nil? or !current_user.admin?
      flash[:notice] = "You are not authorized to do that."
      redirect_to root_path
    end
  end
end
