class Photo < ActiveRecord::Base
  belongs_to :user
	has_many :comments, :dependent => :destroy
  has_many :likes, :dependent => :destroy

  has_many :tag_photo_ships
  has_many :tags, :through => :tag_photo_ships



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

  def tag_name
  end

  def tag_name=(tag_names)
    self.tag_photo_ships.delete_all
    tag_names.split(",").each do |t|
      self.tags << Tag.get(t)
    end
  end


end
