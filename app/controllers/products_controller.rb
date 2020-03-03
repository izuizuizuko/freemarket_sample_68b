class ProductsController < ApplicationController
  before_action :set_product, only: [:show, :destroy, :edit, :update]

  def index
  end

  def new
    @product = Product.new
    @product.images.build
    @category = Category.all.order("id ASC").limit(13)
  end

  def category_children
    @category_children = Category.find(params[:parent_name]).children 
  end

  def category_grandchildren
    @category_grandchildren = Category.find("#{params[:childId]}").children
  end

  def create
    @product = Product.new(product_params)
    @product.status = 1
      if @product.save
          params[:images][:image].each do |image|
            @product.images.create(image: image, product_id: @product.id)
          end
        redirect_to root_path
      else
        @product.images.build
        redirect_to action: "new"
        flash[:notice] = "出品に失敗しました"
      end
  end

  def show
    @category = @product.category
    @images = @product.images
    @image = @images.first
    @address = Address.find_by(user_id: @product.user_id)
  end

  def destroy
    redirect_to root_path if @product.destroy && @product.user_id == current_user.id
  end

  def edit
    # @root_category = @product.category_id
    @root_category = @product.category
    @child_category = Category.find(@product.category_id)
    @grandchild_category = Category.find(@product.category_id)
    # 編集する商品を選択
    # # @product = Product.find(params[:id])
    # 登録されている商品の孫カテゴリーのレコードを取得
    # @selected_grandchild_category = @product.category
    # # # 孫カテゴリー選択肢用の配列作成
    # @category_grandchildren_array = [{id: "---", name: "---"}]
    # Category.find("#{@selected_grandchild_category.id}").siblings.each do |grandchild|
    #   grandchildren_hash = {id: "#{grandchild.id}", name: "#{grandchild.name}"}
    #   @category_grandchildren_array << grandchildren_hash
    # end
    # 選択されている子カテゴリーのレコードを取得
    # @selected_child_category = @selected_grandchild_category.parent
    # # # # 子カテゴリー選択肢用の配列作成
    # @category_children_array = [{id: "---", name: "---"}]
    # Category.find("#{@selected_child_category.id}").siblings.each do |child|
    #   children_hash = {id: "#{child.id}", name: "#{child.name}"}
    #   @category_children_array << children_hash
    # end
    # # # 選択されている親カテゴリーのレコードを取得
    # @selected_parent_category = @selected_child_category.parent
    # # 親カテゴリー選択肢用の配列作成
    # @category_parents_array = [{id: "---", name: "---"}]
    # Category.find("#{@selected_parent_category.id}").siblings.each do |parent|
    #   parent_hash = {id: "#{parent.id}", name: "#{parent.name}"}
    #   @category_parents_array << parent_hash
    # end
  end

  def update
    @product.update(product_params)
  end


  private
  def product_params
    params.require(:product).permit(:name, :detail, :category_id, :price, :condition, :status, :burden, :days, images_attributes: [:image]).merge(user_id: current_user.id)
  end


  def set_product
    @product = Product.find(params[:id])
  end


end

