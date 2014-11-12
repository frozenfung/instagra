class User < ActiveRecord::Base

	has_many :comments

  has_many :photos, :dependent => :destroy
	has_many :created_photos, :foreign_key => "user_id", :class_name => "Photo"

	# has_many :commented_photos, :through => :comments, :source => :photo # which user comment

	has_many :likes
	has_many :like_photos, :through => :likes, source: :photos

  has_many :subscribe
  has_many :subscription_photos, :through => :subscribe, :source => :photos

  def like_this_photo?(p, uid)
    @like = Like.where(:photo_id => p.id, :user_id => uid)
    if @like.count > 0
      true
    else
      false
    end
  end

  def subscribe_this_photo?(p, uid)
    @subscribe = Subscribe.where(:photo_id => p.id, :user_id => uid)
    if @subscribe.count > 0
      true
    else
      false
    end

  end



	def self.from_omniauth(auth_hash)
		user = where( :fb_uid => auth_hash[:uid] ).first_or_initialize
		user.name = auth_hash[:info][:name]
		user.email = auth_hash[:info][:email]
		user.fb_token = auth_hash[:credentials][:token]
		user.fb_expires_at = Time.at(auth_hash[:credentials][:expires_at])
		user.save!
		user
	end
end
