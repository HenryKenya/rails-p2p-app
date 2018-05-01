require 'test_helper'

class TransactionMailerTest < ActionMailer::TestCase
  test "transaction_confirmation" do
    mail = TransactionMailer.transaction_confirmation
    assert_equal "Transaction confirmation", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
