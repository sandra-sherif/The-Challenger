class AddTypeToReport < ActiveRecord::Migration
  def change
    add_column :reports, :upload_type, :string
  end
end
