class CreateTagPhotoShips < ActiveRecord::Migration
  def change
    create_table :tag_photo_ships do |t|
      t.integer :photo_id
      t.integer :tag_id

      t.timestamps
    end
  end
end
