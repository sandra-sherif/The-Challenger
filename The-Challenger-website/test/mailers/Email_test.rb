require 'test_helper'
 
class UserNotifierTest < ActionMailer::TestCase
  test "send_signup_email" do
    # Send the email, then test that it is sent
    email = UserNotifier.send_signup_email('friend@example.com').deliver
    assert_not ActionMailer::Base.deliveries.empty?
 
    # Test the body of the sent email contains what we expect it to
    assert_equal ['from@thechallenger.com'], email.from
    assert_equal ['friend@example.com'], email.to
    assert_equal 'Welcome to The Challanger', email.subject
    assert_equal read_fixture('send_signup_email').join, email.body.to_s
  end
end