class CreateLikes < ActiveRecord::Migration
  def change
    create_table :likes do |t|
      t.integer :user_id
      t.integer :photo_id
      t.boolean :liked, :default => false

      t.timestamps
    end
  end
end