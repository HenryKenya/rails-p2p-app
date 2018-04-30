class CreateTransactions < ActiveRecord::Migration[5.1]
  def change
    create_table :transactions do |t|
      t.integer :amount
      t.references :user
      t.integer :category_id
      t.timestamps
    end
  end
end
