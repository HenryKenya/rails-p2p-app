class TransactionsController < ApplicationController
    before_action :authenticate_user!
    def new
        @transaction = Transaction.new
        @categories = Category.all
        @users = User.all
        @id = User.find_by_id(current_user).id
    end

    def create
        
        @transaction = Transaction.new(transaction_params)
        if @transaction.save
            render json: params
        else
            render json: params
        end
    end

    private
        def transaction_params

            params.require(:transaction).permit(:amount, :category_id, :sender_id, :recipient_id)
        end
end
