class UserCommentsController < ApplicationController

  def create
    @user_comment = UserComment.new(user_comment_params)
    @user_comment.author_id = current_user.id
    @user_comment.save
    redirect_to user_url(@user_comment.profile_id)
  end

  def destroy
    @user_comment = UserComment.find(params[:id])
    @user_comment.destroy
    redirect_to user_url(@user_comment.profile_id)
  end

private
  def user_comment_params
    params.require(:comment).permit(:body, :profile_id)
  end

end
