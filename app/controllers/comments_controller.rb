class CommentsController < ApplicationController
  before_action :check_current_user

  def create
    comment = current_user.comments.create params_comment
    @post = comment.resource
    @comments = @post.comments.includes(:user, parent_comment: :user).get_parents

    respond_to do |format|
      format.js
    end
  end

  private

  def params_comment
    params.require(:comment).permit(:content, :user_id, :resource_id,
      :resource_type, :parent_comment_id)
  end
end

