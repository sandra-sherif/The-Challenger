# Haya Borham - After creating/migrating the class below using the cmd line, the db was synced to add the Description column to it.
class AddDescriptionToChallenges < ActiveRecord::Migration
  def change
    add_column :challenges, :description, :string
  end
end
