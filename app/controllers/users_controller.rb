class UsersController < ApplicationController
    before_action :authenticate_user!
    
    def index
    end

    def show
        @product = current_user.products
        @user = User.find(params[:id])
        @sell = @product.where(status: 1)
        @sold = @product.where(status: 2)
    end

end
