class CommentsController < ApplicationController

  def create
    @comment = Comment.new(comment_param)
    @comment.user = current_user
    @comment.save
    redirect_to :root
  end


  def comment_param
    params.require(:comment).permit(:content, :photo_id)
  end
end
