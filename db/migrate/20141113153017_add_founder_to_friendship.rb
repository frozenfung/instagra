class AddFounderToFriendship < ActiveRecord::Migration
  def change
    add_column :friendships, :founder, :integer
  end
end
