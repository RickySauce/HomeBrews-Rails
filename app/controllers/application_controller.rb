class ApplicationController < ActionController::Base


  private

  def logged_in?
  !!session[:user_id]
  end

  def current_user
    User.find(sessionp[:user_id]) 
  end
end
