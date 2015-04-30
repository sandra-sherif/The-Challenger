class AddDurationToResponse < ActiveRecord::Migration
  def change
    add_column :responses, :duration, :double
  end
end
