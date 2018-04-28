class CreateTransactions < ActiveRecord::Migration[5.1]
  def change
    create_table :transactions do |t|
      t.integer :amount
      t.references :user, foreign_key: true
      t.belongs_to :category, index: true
      t.timestamps
    end
  end
end
