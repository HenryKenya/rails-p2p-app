class CreateTransactions < ActiveRecord::Migration[5.1]
  def change
    create_table :transactions do |t|
      t.integer :amount
      t.integer :sender_id
      t.integer :recipient_id
      t.references :category, foreign_key: true

      t.timestamps
    end
  end
end
