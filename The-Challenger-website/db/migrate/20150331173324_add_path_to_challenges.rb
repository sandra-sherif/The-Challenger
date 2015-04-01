class AddPathToChallenges < ActiveRecord::Migration
  def change
    add_column :challenges, :Path, :string
  end
end
