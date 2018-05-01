class TransactionMailer < ApplicationMailer
  default :from => "noreply@zeecash2.herokuapp.com"
  def transaction_confirmation(recipient, sender)
    @recipient = recipient.email
    @transaction = recipient.transactions.last
    if !@transaction.nil?
      @amount = @transaction.amount
    end
    @sender = sender.email
    mail(:to => "<#{recipient.email}>", :subject => "New Transaction")
  end
end
