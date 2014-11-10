class Photo < ActiveRecord::Base

  belongs_to :user
	has_many :comments
  has_many :likes

  has_attached_file :img, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :img, :content_type => /\Aimage\/.*\Z/
  validates :img, :attachment_presence => true

  validates_presence_of :description


  def count_likes(photos)
    number = photos.likes.count
    if number > 1
      "#{number} likes"
    else
      "#{number} like"
    end
  end
end
