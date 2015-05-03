class CreateResponses < ActiveRecord::Migration
  def change
    create_table :responses do |t|
      t.integer :challenge_id
      t.integer :challenge_owner
      t.string :name
      t.string :path
      t.integer :user_id
      t.string :upload_type

      t.timestamps null: false
    end
  end
end
