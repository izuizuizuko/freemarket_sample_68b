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
      if params[:images].blank?
        @product.images.build
        redirect_to action: "new"
        flash[:notice] = "出品に失敗しました"
      elsif @product.save
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
    @grandchild_category = @product.category
    @child_category = @product.category.parent
    @root_category = @product.category.root
    redirect_to root_path if @product.user_id != current_user.id
  end

  def update
    redirect_to root_path if @product.user_id != current_user.id

    if params[:images].blank? && @product.images.blank?
      @product.images.build
      redirect_to action: "edit"
      flash[:notice] = "出品に失敗しました"
    elsif params[:images].blank?
      @product.update(params.require(:product).permit(:name, :detail, :category_id, :price, :condition, :status, :burden, :days).merge(user_id: current_user.id))
      redirect_to root_path
    elsif @product.update (product_params)
      params[:images][:image].each do |image|
        @product.images.create(image: image, product_id: @product.id)
      end
      redirect_to root_path
    else
      @product.images.build
      redirect_to action: "edit"
      flash[:notice] = "出品に失敗しました"
    end
  end


  private
  def product_params
    params.require(:product).permit(:name, :detail, :category_id, :price, :condition, :status, :burden, :days, images_attributes: [:image]).merge(user_id: current_user.id)
  end


  def set_product
    @product = Product.find(params[:id])
  end


end

