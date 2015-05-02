class AddLikesNumberToResponse < ActiveRecord::Migration
  def change
    add_column :responses, :likes_number, :integer, :default => 0
  end
end
