class AddSentToFriends < ActiveRecord::Migration
  def change
    add_column :friends, :sent_by, :string
    add_column :friends, :sent_to, :string
  end
end
