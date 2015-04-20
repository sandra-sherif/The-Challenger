class CreateChallenges < ActiveRecord::Migration
  def change
    create_table :challenges do |t|
      t.string :name
      t.string :path
      t.integer :user1_id

      t.timestamps
    end
  end
end
