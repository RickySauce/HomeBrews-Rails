class SessionsController < ApplicationController
  before_action :already_logged_in, only: [:new, :create]

  def new
    @user = User.new
  end

  def create
    binding.pry
    @user = User.find_by(username: params["login"]["username"])
    if @user.nil?
      flash[:message] = "Username Not Found"
      render :new
    else
      if !@user.authenticate(params["login"]["password"])
        flash[:message] = "Incorrect Password"
        render :new
      else
        session[:user_id] = @user.id
        flash[:message] = "Successfully Signed In!"
        redirect_to user_path(@user)
      end
    end
  end

  def destroy
    session.delete(:user_id)
    flash[:message] = "Successfully Logged out!"
    redirect_to root_path
  end

  def auth
   request.env['omniauth.auth']
 end

end
