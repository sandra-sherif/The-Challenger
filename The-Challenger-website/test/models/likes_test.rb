require 'spec_helper'
require 'rails_helper'

RSpec.describe Likes, type: :model do

    it "should be invalid without path" do
        likes = Likes.new(user_id: 1)
        expect(likes).to be_invalid
    end

    it "should be invalid without user_id" do
        likes = Likes.new(path: "public/challenges/challenges/path/23/Arrow.mp4")
        expect(likes).to be_invalid
    end
end