class CreateTransactions < ActiveRecord::Migration[5.1]
  def change
    create_table :transactions do |t|
      t.integer :amount
      t.references :user
      t.references :category
      t.timestamps
    end
  end
end
