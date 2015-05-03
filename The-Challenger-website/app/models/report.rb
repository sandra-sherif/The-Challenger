class Report < ActiveRecord::Base
	
	belongs_to :Challenge
	belongs_to :User
	validates :user_id, presence: true
	validates :challenge_id, presence: true
	validates :reason, presence: true
end
