class CreateFriends < ActiveRecord::Migration
  def change
    create_table :friends do |t|
      t.string :Status

      t.timestamps
    end
  end
end
