class TransactionsController < ApplicationController
    before_action :authenticate_user!
    before_action :set_variables
    
    def index
        @transactions = Transaction.all
    end
    def new
        @transaction = Transaction.new
        if @sender_balance.nil?
            @sender_balance = 0
        end
    end

    def create   
        @transaction = Transaction.new(transaction_params)
        sender = User.find(@transaction.sender_id)
        recipient = User.find(@transaction.recipient_id)
        sender.attribute(balance: @sender_balance - @transaction.amount)
        recipient.attribute(balance: recipient.balance + @transaction.amount)
        if @transaction.save
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
