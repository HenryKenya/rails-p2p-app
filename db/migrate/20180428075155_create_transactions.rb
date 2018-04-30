class CreateTransactions < ActiveRecord::Migration[5.1]
  def change
    create_table :transactions do |t|
      t.integer :amount
      t.references :user
      t.references :category_id
      t.timestamps
    end

    add_index :transactions, :recipient_id
    add_index :transactions, :sender_id
    add_index :transactions, [:recipient_id, :sender_id], unique: true
    add_index :transactions, :category_id, unique: true

  end
end
