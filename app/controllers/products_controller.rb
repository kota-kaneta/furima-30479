class ProductsController < ApplicationController
  def index
    @products = Product.all.order('id DESC')
  end

  def new
    @product = Product.new
    authenticate_user!
  end

  def create
    @product = Product.create(product_params)
    if @product.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def product_params
    params.require(:product).permit(:title, :description, :price, :charge_id, :day_id, :source_id, :category_id, :status_id, :image).merge(user_id: current_user.id)
  end
end
