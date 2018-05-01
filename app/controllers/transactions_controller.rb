class TransactionsController < ApplicationController
    before_action :authenticate_user!
    before_action :set_variables
    

    def new
        @transaction = Transaction.new
        if @sender_balance.nil?
            @balance = 0
        end
    end

    def create
        
        @transaction = Transaction.new(transaction_params)
        if @transaction.save
            sender = User.find(@transaction.sender_id)
            recipient = User.find(@transaction.recipient_id)

            sender.update_attributes(balance: @sender_balance - @transaction.amount)
            recipient.update_attributes(balance: recipient.balance + @transaction.amount)

            flash[:success] = "Transaction successful!"
            redirect_to new_transaction_path
        else
            flash[:error] = "Something went wrong!"
            redirect_to new_transaction_path
        end
    end

    private
        def transaction_params
            params.require(:transaction).permit(:amount, :category_id, :sender_id, :recipient_id)
        end

        def set_variables
            @categories = Category.all #call all categories for display in select
            @users = User.all # call all users for display in select
            @sender_id =User.find_by_id(current_user).id
            @sender_balance = User.find_by_id(current_user).balance
            
        end

        
end
