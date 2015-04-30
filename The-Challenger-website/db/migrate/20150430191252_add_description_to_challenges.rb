class AddDescriptionToChallenges < ActiveRecord::Migration
  def change
    add_column :challenges, :description, :string
  end
end
