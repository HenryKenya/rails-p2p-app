class Transaction < ApplicationRecord
    belongs_to :sender, foreign_key: :sender_id, class_name: 'User'
    belongs_to :recipient, foreign_key: :recipient_id, class_name: 'User'
    belongs_to :category, foreign_key: :category_d, class_name: 'Category'
end
