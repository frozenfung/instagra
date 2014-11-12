class CommentsController < ApplicationController
<<<<<<< HEAD
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

=======

  def create
    @comment = Comment.new(comment_param)
    @comment.user = current_user
    @comment.save
    redirect_to :root
  end


  def comment_param
    params.require(:comment).permit(:content, :photo_id)
  end

>>>>>>> refs/remotes/origin/master
end
