class ProductsController < ApplicationController

  def new
    @product = Product.new
    @product.images.build
  end



end
