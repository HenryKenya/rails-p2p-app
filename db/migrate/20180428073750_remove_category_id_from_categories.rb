class RemoveCategoryIdFromCategories < ActiveRecord::Migration[5.1]
  def change
    remove_column :categories, :category_id, :integer
  end
end
