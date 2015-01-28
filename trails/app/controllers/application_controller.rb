class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :authorize

  def authorize
    if not_logged_in?
      redirect_to root_url, notice: "Please log in"
    end
  end

  def not_logged_in?
    session[:user_id].nil?
  end

  def current_user
    User.find(session[:user_id])
  end
end
