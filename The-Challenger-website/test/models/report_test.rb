require 'spec_helper'
require 'rails_helper'

RSpec.describe Report, type: :model do
  
    it "is invalid user_id" do
        report = Report.new(challenge_id: 2, reason: "It's harassing me")
        expect(report).to be_invalid
    end

    it "is invalid challenge_id" do
        report = Report.new(user_id: 2, reason: "It's harassing me")
        expect(report).to be_invalid
    end

    it "is invalid reason" do
        report = Report.new(challenge_id: 2, user_id: 1)
        expect(report).to be_invalid
    end

end