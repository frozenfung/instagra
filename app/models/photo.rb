class Photo < ActiveRecord::Base
  has_attached_file :img, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :img, :content_type => /\Aimage\/.*\Z/
  validates :img, :attachment_presence => true
  
  validates_presence_of :title
  belongs_to :user
  has_many :comments
end
