class CreateNotifications < ActiveRecord::Migration
  def change
    create_table :notifications do |t|
      t.integer :sent_by
      t.integer :sent_to
      t.integer :challenge_id
      t.integer :comment_id
      t.string :text

      t.timestamps null: false
    end
  end
end
