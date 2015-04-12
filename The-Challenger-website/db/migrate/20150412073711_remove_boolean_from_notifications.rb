class RemoveBooleanFromNotifications < ActiveRecord::Migration
  def change
    remove_column :notifications, :boolean, :boolean
  end
end
