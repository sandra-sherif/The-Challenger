class Response < ActiveRecord::Base

	belongs_to :user1, :class_name => "User", :foreign_key => "user_id"
	belongs_to :challenge, :class_name => "Challenge", :foreign_key => "challenge_id"
	mount_uploader :path, ResponseUploader
    validates :name, presence: true
    validates :upload_type, presence: true
    validates :path, presence: true
    validates :challenge_id, presence: true
    validates :challenge_owner, presence: true

end
