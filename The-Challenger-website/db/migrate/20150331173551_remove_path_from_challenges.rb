class RemovePathFromChallenges < ActiveRecord::Migration
  def change
    remove_column :challenges, :Path, :string
  end
end
