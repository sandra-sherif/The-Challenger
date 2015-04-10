# spec/factories/comments.rb
FactoryGirl.define do
  factory :comment do |f|
    f.text "Testing comment"
    f.text ""
  end
end