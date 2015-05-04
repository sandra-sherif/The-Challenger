class AddSharingWithToChallenge < ActiveRecord::Migration
  def change
    add_column :challenges, :sharing_with, :string
  end
end
