class Category < ApplicationRecord
    has_many :transactions, foreign_key: :category_id, class_name: 'Transaction'
end
