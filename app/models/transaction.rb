class Transaction < ApplicationRecord
  belongs_to :category
  belongs_to :sender, foreign_key: :sender_id, class_name: 'User'
  belongs_to :recipient, foreign_key: :recipient_id, class_name: 'User'

  before_save :check_and_update_balance

  def check_and_update_balance
    recipient = User.find(recipient_id)
    sender = User.find(sender_id)
    sender.update_attributes(balance: sender.balance - amount)
    
  end

end
