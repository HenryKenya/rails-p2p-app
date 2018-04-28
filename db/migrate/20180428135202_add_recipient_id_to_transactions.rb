class AddRecipientIdToTransactions < ActiveRecord::Migration[5.1]
  def change
    add_column :transactions, :recipient_id, :integer
  end
end
