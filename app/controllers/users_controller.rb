class UsersController < ApplicationController

  before_action :ensure_signed_in, only: [:show]

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      sign_in(@user)
      redirect_to user_url(@user)
    else
      render :new
    end
  end

  def show
    @user = User.find(params[:id])
    @goal = Goal.new
  end

private
  def user_params
    params.require(:user).permit(:username, :password)
  end

  def ensure_signed_in
    redirect_to new_session_url unless signed_in?
  end
end
