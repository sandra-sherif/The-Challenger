class AddImgPathToUsers < ActiveRecord::Migration
  def change
    add_column :users, :img_path, :string
  end
end
