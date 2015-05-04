class AddBlockedToBlocks < ActiveRecord::Migration
  def change
  	add_column :blocks, :blocked_by, :string
    add_column :blocks, :blocked, :string
  end
end
