class AddChallengerEmailToChallenges < ActiveRecord::Migration
  def change
    add_column :challenges, :email, :string
  end
end
