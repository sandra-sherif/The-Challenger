class AddDescriptionToResponses < ActiveRecord::Migration
  def change
    add_column :responses, :description, :string
  end
end
