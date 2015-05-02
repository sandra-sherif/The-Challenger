class AddTypeToLikes < ActiveRecord::Migration
  def change
    add_column :likes, :upload_type, :string
  end
end
