class ProductsController < ApplicationController

  def index
  end


  def new
    @product = Product.new
    @product.images.build()
    @category = Category.all.order("id ASC").limit(13)
  end


  def create
    @product = Product.new(product_params)
    respond_to do |format|
      if @product.save
          params[:product_images][:image].each do |image|
            @product.images.create(image: image, product_id: @product.id)
          end
        format.html{redirect_to root_path}
      else
        @product.images.build
        render "new"
      end
    end
  end

  def category_children
    #選択された親カテゴリーに紐付く子カテゴリーの配列を取得
    @category_children = Category.find(params[:parent_name]).children 
  end

  # 子カテゴリーが選択された後に動くアクション
  def category_grandchildren
    #選択された子カテゴリーに紐付く孫カテゴリーの配列を取得
    @category_grandchildren = Category.find(params[:child_id]).children
  end





  def show
  end

  private
  def product_params
    params.require(:product).permit(:name, :detail, :category_id, :price, :condition, :status, :burden, :days, images_attributes: [:image]).merge(user_id: current_user.id)
  end



end
