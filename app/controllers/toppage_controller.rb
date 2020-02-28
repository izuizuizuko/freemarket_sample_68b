class ToppageController < ApplicationController
  def index
    @goods = Product.all.order(created_at: :desc).limit(3)
  end

end
