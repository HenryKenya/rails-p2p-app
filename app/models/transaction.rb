class Transaction < ApplicationRecord
    belongs_to :category, foreign_key: :category_id, class_name: 'Category'
    belongs_to :sender, foreign_key: :sender_id, class_name: 'User'
    belongs_to :recipient, foreign_key: :recipient_id, class_name: 'User'   
end
