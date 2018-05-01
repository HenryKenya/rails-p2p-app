class TransactionMailer < ApplicationMailer
  default :from => "noreply@zeecash2.herokuapp.com"
  def transaction_confirmation(user)
    mail(:to => "<#{user.email}>", :subject => "New Transaction")
  end
end
