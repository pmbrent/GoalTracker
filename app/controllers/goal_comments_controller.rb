class GoalCommentsController < ApplicationController

  def create
    @goal_comment = GoalComment.new(goal_comment_params)
    @goal_comment.author_id = current_user.id
    @goal_comment.save
    redirect_to goal_url(@goal_comment.goal_id)
  end

  def destroy
    @goal_comment = GoalComment.find(params[:id])
    @goal_comment.destroy
    redirect_to goal_url(@goal_comment.goal_id)
  end

private
  def goal_comment_params
    params.require(:comment).permit(:body, :goal_id)
  end
end
