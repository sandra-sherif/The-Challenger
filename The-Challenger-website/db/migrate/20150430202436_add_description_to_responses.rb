# Haya Borham - After creating/migrating the class below using the cmd line, the db was synced to add the Description column to it.
class AddDescriptionToResponses < ActiveRecord::Migration
  def change
    add_column :responses, :description, :string
  end
end
