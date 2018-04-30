class CreateTransactions < ActiveRecord::Migration[5.1]
  def change
    create_table :transactions do |t|
      t.integer :amount
      t.integer :sender_id
      t.integer :category_id
      t.integer :recipient_id

      t.timestamps
end
