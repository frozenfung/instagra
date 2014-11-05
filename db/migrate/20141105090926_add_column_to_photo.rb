class AddColumnToPhoto < ActiveRecord::Migration
  def change
    add_column :photos, :title, :string
    add_column :photos, :user_id, :integer
  end
end
