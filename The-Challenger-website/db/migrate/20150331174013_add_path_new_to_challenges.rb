class AddPathNewToChallenges < ActiveRecord::Migration
  def change
    add_column :challenges, :path, :string
  end
end
