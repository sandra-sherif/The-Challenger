class Challenge < ActiveRecord::Base
	belongs_to :user 
	#mount_uploader :path, FileUploader
end
