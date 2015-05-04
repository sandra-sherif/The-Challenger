require 'spec_helper'
require 'rails_helper'

RSpec.describe Friends, type: :model do

    it "should be invalid without sent_to" do
        friends = Friends.new(sent_by: 1, status: "Pending")
        expect(friends).to be_invalid
    end

    it "should be invalid without sent_by" do
        friends = Friends.new(sent_to: 1, status: "Pending")
        expect(friends).to be_invalid
    end

    it "should be invalid without status" do
        friends = Friends.new(sent_by: 1, sent_to: 2)
        expect(friends).to be_invalid
    end
end