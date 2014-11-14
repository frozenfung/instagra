class AddCheckedToFriendship < ActiveRecord::Migration
  def change
    add_column :friendships, :checked, :boolean, :default => false
  end
end
