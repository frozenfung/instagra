class Tag < ActiveRecord::Base

  has_many :tag_photo_ships, :dependent => :destroy
  has_many :photos, :through => :tag_photo_ships

  def self.get(name)
    self.find_by_name(name) || self.create(:name => name)
  end

end
