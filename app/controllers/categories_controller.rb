class CategoriesController < ApplicationController

    def index
    end

    def show
        @category = Category.find(params[:id])
        if @category.has_children? && @category.has_parent?
            @categories = @category.children
            @categoryname = @category.child_ids
            @item = Product.where(category_id: @categoryname).order("created_at DESC").page(params[:page]).per(20)
        elsif @category.is_childless? 
            @categoryname = @category.sibling_ids
            @categories = Category.find(@categoryname)
            @item = @category.products.order("created_at DESC").page(params[:page]).per(20)
        else
            @categories = @category.children
            @categoryname = @category.indirect_ids
            @item = Product.where(category_id: @categoryname).order("created_at DESC").page(params[:page]).per(20)
        end
    end

end
