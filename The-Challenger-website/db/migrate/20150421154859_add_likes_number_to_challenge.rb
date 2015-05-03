class AddLikesNumberToChallenge < ActiveRecord::Migration
  def change
    add_column :challenges, :likes_number, :integer, :default => 0
  end
end
