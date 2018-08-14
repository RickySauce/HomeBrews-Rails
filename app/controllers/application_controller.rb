class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :current_user
  #before_action :require_logged_in, except: [:new, :create, :welcome]

  def welcom
  end

  def logged_in?
    !!current_user
  end

  private

    def already_logged_in
      redirect_to user_path(current_user) if logged_in?
    end

    def require_logged_in
      redirect_to root_path unless logged_in?
    end

    def current_user
      @current_user ||= User.find(session[:user_id]) if session[:user_id]
    end

    helper_method :current_user
    helper_method :logged_in?

end
