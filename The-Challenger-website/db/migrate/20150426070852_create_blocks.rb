class CreateBlocks < ActiveRecord::Migration
  def change
    create_table :blocks do |t|
    	# t.integer :blocked_by
    	# t.integer :blocked 

      t.timestamps null: false
    end
  end
end
