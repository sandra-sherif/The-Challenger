class AddUploadTypeToChallenge < ActiveRecord::Migration
  def change
    add_column :challenges, :upload_type, :string
  end
end
