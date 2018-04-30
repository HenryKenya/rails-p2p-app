class Category < ApplicationRecord
    has_many :transactions, class_name: "Transaction", foreign_key: :category_id
end
