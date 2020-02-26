class ProductsController < ApplicationController

  
  def new
    @product = Product.new
    @product.images.build
  end


  def show
    @product = Product.find(params[:id])
    @category = @product.category
    @images = @product.images
    @image = @images.first
  end

 




  

  
end







