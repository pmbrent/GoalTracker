class GoalsController < ApplicationController

  before_action :require_signed_in

  def show
    @goal = Goal.find(params[:id])
  end

  def create
    @goal = Goal.new(goal_params)
    @goal.user_id = current_user.id
    if @goal.save
      redirect_to goal_url(@goal)
    else
      redirect_to user_url(current_user)
    end
  end

  def edit
    @goal = Goal.find(params[:id])
  end

  def update
    @goal = Goal.find(params[:id])
      if @goal.update_attributes(goal_params)
        redirect_to goal_url(@goal)
      else
        render :edit
      end
  end

  def destroy
    @goal = Goal.find(params[:id])
    @goal.destroy
    redirect_to user_url(current_user)
  end

  def goal_params
    params.require(:goal).permit(:title, :description, :private, :completed)
  end

end
