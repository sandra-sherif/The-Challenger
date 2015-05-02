class CreateReports < ActiveRecord::Migration
  def change
    create_table :reports do |t|
      t.integer :challenge_id
      t.integer :user_id
      t.string :reason

      t.timestamps null: false
    end
  end
end
