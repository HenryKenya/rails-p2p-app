class TransactionsController < ApplicationController
    before_action :authenticate_user!
    def index
        @categories = Category.all
        @users = User.all
    end

    def create        
        transaction = Transaction.new(transactions_params, sender_id: current_user.id)

        if transaction.save
            flash[:success] = "Transaction Posted"
            redirect_to '/dashboard'
        else
            flash[:error] = "Something went wrong!"
            redirect_to '/dashboard'
        end
    end

    private
        def transactions_params

            params.require(:amount, :category_id, :recipient_id)
        end
end
