class ProductsController < ApplicationController
  before_action :set_product, only: [:show, :destroy]

  def index
  end
  
  def new
    @product = Product.new
    @product.images.build
  end


  def show
    @category = @product.category
    @images = @product.images
    @image = @images.first
    @address = Address.find_by(user_id: current_user.id)
  end


  def destroy
    @product.destroy if @product.user_id == current_user.id
    redirect_to root_path if @product.destroy && @product.user_id == current_user.id
  end
        

  private
  def set_product
    @product = Product.find(params[:id])
  end

end

