class Challenge < ActiveRecord::Base
	belongs_to :user1, :class_name => "User", :foreign_key => "user1_id"
	belongs_to :user2, :class_name => "User", :foreign_key => "user2_id"
	has_many :comments, dependent: :destroy
	mount_uploader :path, UploadUploader
    validates :name, presence: true
    validates :upload_type, presence: true
    validates :path, presence: true

 

end
