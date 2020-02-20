class ProductsController < ApplicationController
  def index
  end

  def category
    @products = Product.page(params[:page]).per(100)
  end

  def new
    @product = Product.new
    @product.images.build
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      redirect_to action: 'index'
    else
      render "new"
    end
  end

  private
  def product_params
    params.require(:product).permit(:name, :detail, :category_id, :price, :condition, :status, images_attributes: [:image]).merge(user_id: current_user.id)
  end

end
