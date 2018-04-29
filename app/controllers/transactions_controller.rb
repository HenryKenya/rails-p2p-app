class TransactionsController < ApplicationController
    before_action :authenticate_user!
    def new
        @categories = Category.all
        @users = User.all
        @transaction = Transaction.new
    end

    def create
    end
end
