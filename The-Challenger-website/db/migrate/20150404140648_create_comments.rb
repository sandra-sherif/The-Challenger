class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
    	t.string :text

		t.references :challenge, index: true
    	t.references :user, index: true	

      t.timestamps

      
    end

    add_foreign_key :comments, :challenges
    add_foreign_key :comments, :users

  end
end
