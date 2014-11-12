class CommentsController < ApplicationController
  def create
    @comment = Comment.new(comment_params)
    @comment.user = current_user
    @comment.photo = @photo
    if @comment.save
      redirect_to :root
    else
      redirect_to :root
  end

  def destroy

  end

  def comment_params
    params.require(:comment).permit(:content)
  end 

end
