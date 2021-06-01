require 'test_helper'

class PatientMailerTest < ActionMailer::TestCase
  test "invitation" do
    mail = PatientMailer.invitation
    assert_equal "Invitation", mail.subject
    assert_equal ["to@google_api.org"], mail.to
    assert_equal ["from@google_api.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
