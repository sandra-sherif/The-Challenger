class TaggingController < ApplicationController
before_filter :signed_in_user, only: [:create, :destroy]
	
def index
  if params[:tag]
    @challenges = Challenge.tagged_with(params[:tag])
  else
    @challenges = Challenge.all
  end
end

def new
		@tag = tag.new
	end

	def create
		tag = current_user.Challenge.build(params[:text])
		tag.challenge = Challenge.find(params[:challenge_id])
		tag.save
end

class challenge < ActiveRecord::Base # class upload video/image
  attr_accessible :name, :upload_tpye, :path, :tags_attributes
 
  validates :name,  :presence => true
  validates :upload_tpye, :presence => true
                   # :length => { :minimum => 5 }
 validates :path :presence => true
  has_many :comments, :dependent => :destroy
  has_many :tags
 
  accepts_nested_attributes_for :tags, :allow_destroy => :true,
    :reject_if => proc { |attrs| attrs.all? { |k, v| v.blank? } }
end

