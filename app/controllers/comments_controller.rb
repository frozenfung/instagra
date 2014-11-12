class CommentsController < ApplicationController

  before_action :set_photo

  def create
    @comment = @photo.comments.new(comment_param)
    @comment.user = current_user
    @comment.save
    redirect_to :root
  end

  protected

  def set_photo    
    @photo = Photo.find( params[:photo_id] )
  end

  def comment_param
    params.require(:comment).permit(:content)
  end

end
