class Challenge < ActiveRecord::Base

	#authored by Marina ElDib
	#It enables the search for challenger to search by name or category of the challenge
	#It takes the name of the challenge and the category as a parameter
	ransacker :name_category do 
		|parent| Arel::Nodes::InfixOperation.new('||', 
		Arel::Nodes::InfixOperation.new('||', parent.table[:name], Arel::Nodes.build_quoted(' ')
    	), parent.table[:category])
	end
	
	belongs_to :user1, :class_name => "User", :foreign_key => "user1_id"
	has_many :comments, dependent: :destroy
	has_many :responses, dependent: :destroy
	has_many :reports, dependent: :destroy
	mount_uploader :path, UploadUploader
	validates :name, presence: true
	validates :upload_type, presence: true
	validates :path, presence: true
	validates :category, presence: true

end
