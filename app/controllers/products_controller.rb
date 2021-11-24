class ProductsController < ApplicationController
  def index
    @products = Product.all
  end
  
  def new
    @product = Product.new
  end
  
  def create
    @product = Product.new(product_params)
    if @product.save
      redirect_to products_path, notice: 'Product Added!'
    else
      render :new
    end
  end
  
  def edit
    @product = Product.find_by(id:params[:id])
  end
  
  def update
    @product = Product.find_by(id:params[:id])
    if @product.update(product_params)
      redirect_to products_path, notice: 'Product Updated!'
    else
      render :edit
    end
  end
  
  def destroy
    @product = Product.find_by(id:params[:id])
    if @product.destroy
      redirect_to products_path, notice: 'Product Deleted!'
    end
  end
  
  private
  def product_params
    params.require(:product).permit(:name, :category, :price)
  end
end
