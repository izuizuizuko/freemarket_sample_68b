class UsersController < ApplicationController
    before_action :authenticate_user!
    before_action :set_product, only: [:show, :sell, :sold]
    def index
    end

    def show
        @user = User.find(params[:id])
        @sell = @product.where(status: 1)
        @sold = @product.where(status: 2)
    end

    def sell
        @goods = @product.where(status: 1)
    end

    def sold
        @goods = @product.where(status: 2)
    end
    private
    def set_product
        @product = current_user.products
    end

end
