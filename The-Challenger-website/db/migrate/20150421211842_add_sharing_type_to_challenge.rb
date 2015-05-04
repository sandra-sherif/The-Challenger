class AddSharingTypeToChallenge < ActiveRecord::Migration
  def change
    add_column :challenges, :sharing_type, :string
  end
end
