class Challenge < ActiveRecord::Base
	
	# A challenge has user1_id and user2_id attributes as foreign keys from table User.
	# A challenge has many comments.
	# The model uses the Uploader class that was generated in order to get the path of the uploaded challenge.
	# In order to create a new challenge the user must provide name, upload_type and path,
	belongs_to :user1, :class_name => "User", :foreign_key => "user1_id"
	belongs_to :user2, :class_name => "User", :foreign_key => "user2_id"
	has_many :comments
	mount_uploader :path, UploadUploader
    validates :name, presence: true
    validates :upload_type, presence: true
    validates :path, presence: true

end
