module ApplicationHelper
  def like_this_photo?(p)
    @like = Like.where(:photo_id => p.id, :user_id => current_user.id)
    if @like.count > 0
      true
    else
      false
    end
  end
end
