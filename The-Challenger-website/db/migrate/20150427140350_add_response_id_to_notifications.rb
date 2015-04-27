class AddResponseIdToNotifications < ActiveRecord::Migration
  def change
    add_column :notifications, :response_id, :integer
  end
end
