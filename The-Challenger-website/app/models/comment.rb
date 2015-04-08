class Comment < ActiveRecord::Base

	belongs_to :challenge
	belongs_to :user
	validates :text, presence: true
	validates :challenge_id, presence: true
	validates :user_id, presence: true
	
end