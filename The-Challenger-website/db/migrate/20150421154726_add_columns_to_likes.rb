class AddColumnsToLikes < ActiveRecord::Migration
  def change
    add_column :likes, :user_id, :integer
    add_column :likes, :path, :string
  end
end
