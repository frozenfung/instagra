class User < ActiveRecord::Base

	has_many :comments

  has_many :photos, :dependent => :destroy
	has_many :created_photos, :foreign_key => "user_id", :class_name => "Photo"

	# has_many :commented_photos, :through => :comments, :source => :photo # which user comment

	has_many :likes
	has_many :like_photos, :through => :likes, source: :photo

  has_many :subscribes
  has_many :subscription_photos, :through => :subscribes, :source => :photo

  has_many :friendships
  has_many :friends, :through => :friendships


  def find_photo_like(photo)
    self.likes.where(:photo => photo).first
  end

  def like_this_photo?(photo)
    like = find_photo_like(photo)
    like.present?
  end

  def find_photo_subscription(photo)
    self.subscribes.where(:photo => photo).first
  end

  def subscribe_this_photo?(photo)
    subscribe = find_photo_subscription(photo)
    subscribe.present?
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
