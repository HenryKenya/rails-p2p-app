class TransactionsController < ApplicationController
    before_action :authenticate_user!
    def new
        @categories = Category.all
        @users = User.all
    end
end
