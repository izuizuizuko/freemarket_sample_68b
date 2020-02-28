class ToppageController < ApplicationController
  before_action :set_product, only: [:sell, :sold]

  def index
    @goods = Product.all.order(created_at: :desc).limit(3)
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
