class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :First_Name
      t.string :Last_Name
      t.integer :Age
      t.string :email
      t.string :Password
      t.string :Img_Path

      t.timestamps
    end
  end
end
