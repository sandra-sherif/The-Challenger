class Tag < ActiveRecord::Base
  belongs_to :Challenge, :class_name => "Challenge", :foreign_key => "challenge_id"
   belongs_to :Challenge_response, :class_name => "Challenge", :foreign_key => "challenge_id"
  	belongs_to :User, :class_name => "User", :foreign_key => "user_id"
  attr_accessible :name
  has_many :taggings
  has_many :articles, through: :taggings
end