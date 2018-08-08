class SubStylesController < ApplicationController

  def index
    @sub_styles = SubStyle.all
  end

  def show
    @user = User.find(params[:user_id]) if params[:user_id]
    @sub_style = SubStyle.find(params[:id])
  end

end
