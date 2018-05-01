class TransactionMailer < ApplicationMailer
  default :from => "noreply@zeecash2.herokuapp.com"
  def transaction_confirmation(recipient, sender)
    @recipient = recipient.email
    @transaction = sender.transactions.last
    @sender = sender.email
    mail(:to => "<#{recipient.email}>", :subject => "New Transaction")
  end
end
